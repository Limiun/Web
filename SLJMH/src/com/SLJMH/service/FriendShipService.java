/*
 *
 * www.prosysoft.com Inc.
 * Copyright (c) 2019  All Rights Reserved
 */

package com.SLJMH.service;

import com.SLJMH.entity.FriendShip;

import java.util.List;

/**
 * 好友关系服务
 * @date 2019-06-18 20:10
 */
public interface FriendShipService<T>{

    /**
     * 保存实体
     *
     * @param entity
     */
    public void save(T entity);
    /**
     * 删除实体
     *
     * @param id
     */
    public void delete(long id);
    /**
     * 根据ID删除实体
     *
     * @param id
     */


    /**
     * 更新实体
     *
     * @param entity
     */
    public void update(T entity);
    /**
     * 按id查询
     *
     * @param id
     * @return
     */
    /**
     * 查询所有
     *
     * @return
     */
    public List<T> findAll();

    /**
     * 根据id获取好友
     * @param id
     * @return
     */
    T get(long id);

    /**
     * 修改备注
     * @param id
     * @param remark
     */
    void updateRemark(long id, String remark);

    /**
     * 更新状态
     * @param id
     */
    void updateStatusToAgree(long id);

    /**
     * 获取用户好友
     * @param userId
     * @return
     */
    List<T> findAllByUserId(long userId);

    /**
     * 添加好友
     * @param searchKey
     */
    void addFriend(long userId,String searchKey);
}
