package com.SLJMH.service.impl;

import com.SLJMH.constant.FriendShipStatus;
import com.SLJMH.dao.FriendShipDao;
import com.SLJMH.dao.UserDao;
import com.SLJMH.entity.FriendShip;
import com.SLJMH.entity.User;
import com.SLJMH.service.FriendShipService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;

import java.io.FileReader;
import java.util.Date;
import java.util.List;

/**
 * @author liubin@sodotec.cn
 * @date 2019-06-18 20:15
 */
@Service
public class FriendShipServiceImpl implements FriendShipService<FriendShip> {

    @Autowired
    private FriendShipDao friendShipDao;

    @Autowired
    private UserDao userDao;

    @Override
    public void save(FriendShip entity) {
        friendShipDao.save(entity);
    }

    @Override
    public void delete(long id) {
        FriendShip friendShip = get(id);
        //好友id
        long friendUserId = friendShip.getFriendUserId();

        FriendShip friend = friendShipDao.findByUserIdAndFriendUserId(friendUserId,friendShip.getUserId());

        //在当前用户好友中删除
        friendShipDao.delete(friendShip);
        if(friend != null){
            //更新自己在对方好友列表中的状态
            friend.setStatus(FriendShipStatus.PEER_DELETED);
            friendShipDao.update(friend);
        }
    }

    @Override
    public void update(FriendShip entity) {
        friendShipDao.update(entity);
    }

    @Override
    public List<FriendShip> findAll() {
        return friendShipDao.findAll(FriendShip.class.getSimpleName());
    }

    @Override
    public FriendShip get(long id) {
        return friendShipDao.get(id);
    }

    @Override
    public void updateRemark(long id, String remark) {
        FriendShip friendShip = get(id);
        friendShip.setRemark(remark);
        friendShipDao.update(friendShip);
    }

    @Override
    public void updateStatusToAgree(long id) {
        //建立自己的好友关系
        FriendShip friendShip = get(id);
        friendShip.setStatus(FriendShipStatus.FRIEND);
        friendShipDao.update(friendShip);

        FriendShip peerFriendShips = friendShipDao.findByUserIdAndFriendUserId(friendShip.getFriendUserId(),friendShip.getUserId());
        peerFriendShips.setStatus(FriendShipStatus.FRIEND);
        friendShipDao.update(peerFriendShips);
    }

    @Override
    public List<FriendShip> findAllByUserId(long userId) {
        return friendShipDao.findAllByUserId(userId);
    }

    @Override
    public void addFriend(long userId,String searchKey) {
        User currLoginUser  = userDao.findById((int) userId);

        List<User> searchedUsers = friendShipDao.findByUserNameOrNickName(searchKey);
        if(searchedUsers.size() > 1){
            throw new IllegalStateException("根据用户名查询到多个同名用户,请再次精确检索条件");
        }

        if(searchedUsers.size() == 0){
            throw new IllegalArgumentException("用户不存在,请确认用户名或者昵称输入正确");
        }

        User user = searchedUsers.get(0);

        FriendShip friendShip = new FriendShip();
        friendShip.setStatus(0);
        friendShip.setFriendNickName(currLoginUser.getUserNickName());
        friendShip.setAddTime(new Date());
        friendShip.setFriendUserPic(currLoginUser.getUserPic());
        friendShip.setFriendUserId(currLoginUser.getUserId().longValue());
        friendShip.setUserId(user.getUserId().longValue());

        FriendShip selfFriendShip = new FriendShip();
        selfFriendShip.setFriendUserId(user.getUserId().longValue());
        selfFriendShip.setFriendUserPic(user.getUserPic());
        selfFriendShip.setAddTime(new Date());
        selfFriendShip.setStatus(3);
        selfFriendShip.setUserId(currLoginUser.getUserId().longValue());
        selfFriendShip.setFriendNickName(user.getUserNickName());

        try{
            friendShipDao.save(friendShip);
            friendShipDao.save(selfFriendShip);
        }
        catch (DuplicateKeyException e){
            throw new RuntimeException("好友关系已经存在,请勿重复添加");
        }

    }
}
