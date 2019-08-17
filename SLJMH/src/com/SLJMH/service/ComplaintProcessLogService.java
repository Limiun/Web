package com.SLJMH.service;

import com.SLJMH.entity.ComplaintProcessLog;

import java.util.List;

/**
 * 投诉处理记录
 */
public interface ComplaintProcessLogService {

    /**
     * 根据投诉记录id获取投诉处理记录
     * @param complaintId
     * @return
     */
    List<ComplaintProcessLog> findByComplaintId(long complaintId);
}
