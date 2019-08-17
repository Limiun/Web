package com.SLJMH.dao.impl;

import com.SLJMH.dao.FriendShipDao;
import com.SLJMH.entity.FriendShip;
import com.SLJMH.entity.User;

import java.util.List;

public class FriendShipDaoImpl extends BaseDaoImpl<FriendShip> implements FriendShipDao {

    private Class<?> entityClass = FriendShip.class;

    private final String HQL_SELECT_PRIFIX = "from " + FriendShip.class.getCanonicalName()+" ";

    @Override
    public FriendShip get(long id) {
        return (FriendShip) getHibernateTemplate().get(entityClass,id);
    }

    @Override
    public FriendShip findByUserIdAndFriendUserId(long userId, long friendUserId) {
        List<FriendShip> friendShipList = getHibernateTemplate().find("from " + FriendShip.class.getCanonicalName()+" where userId=? and friendUserId=?",userId,friendUserId);
        if(friendShipList.size() == 1){
            return friendShipList.get(0);
        }
        return null;
    }

    @Override
    public List<FriendShip> findAllByUserId(long userId) {
        return getHibernateTemplate().find("from " + FriendShip.class.getCanonicalName()+" where userId=? and status in(0,1,2)",userId);
    }

    @Override
    public List<User> findByUserNameOrNickName(String searchKey) {
        return getHibernateTemplate().find("from "+User.class.getCanonicalName()+" where userName = ? or userNickName = ?",searchKey,searchKey);
    }
}
