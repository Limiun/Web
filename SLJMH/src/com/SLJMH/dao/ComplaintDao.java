package com.SLJMH.dao;

import com.SLJMH.entity.Complaint;

import java.util.List;

/**
 * 投诉Dao
 */
public interface ComplaintDao {

    /**
     * 获取被投诉列表
     * @param userId
     * @return
     */
    List<Complaint> findByComplaintedUserId(long userId);


    void save(Complaint complaint);

    /**
     * 获取投诉
     * @param id
     * @return
     */
    Complaint get(long id);


    void update(Complaint complaint);


    List<Complaint> findAll();
}
