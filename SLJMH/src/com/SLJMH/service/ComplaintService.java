package com.SLJMH.service;

import com.SLJMH.entity.Complaint;

import java.util.List;

/**
 * 投诉服务接口
 */
public interface ComplaintService {

    /**
     * 获取用户发起的投诉
     * @param userId
     * @return
     */
    List<Complaint> findByComplaintedUserId(long userId);

    /**
     * 创建投诉
     * @param complaint
     */
    void createComplaint(Complaint complaint);

    /**
     * 申诉
     * @param id
     */
    void appeal(long id,String appealReason);

    /**
     * 获取全部投诉
     * @return
     */
    List<Complaint> findAll();

    /**
     * 处理投诉
     * @param processUserId
     * @param processResult
     * @param processReason
     */
    void audit(long complaintId,int processUserId,int processResult,String processReason);
}
