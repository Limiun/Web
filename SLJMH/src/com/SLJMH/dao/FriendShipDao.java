package com.SLJMH.dao;

import com.SLJMH.entity.FriendShip;
import com.SLJMH.entity.User;

import java.util.List;

/**
 * 好友DAO
 */
public interface FriendShipDao extends BaseDao<FriendShip> {

    /**
     * 根据id获取实体
     * @param id
     * @return
     */
    FriendShip get(long id);

    /**
     * 根据用户id和好友id获取好友关系
     * @param userId
     * @param friendUserId
     * @return
     */
    FriendShip findByUserIdAndFriendUserId(long userId,long friendUserId);

    /**
     * 根据用户id查询好友
     * @param userId
     * @return
     */
    List<FriendShip> findAllByUserId(long userId);

    /**
     * 根据用户名或者昵称检索用户
     * @param searchKey
     * @return
     */
    List<User> findByUserNameOrNickName(String searchKey);
}
