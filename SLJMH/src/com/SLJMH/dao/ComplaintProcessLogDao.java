package com.SLJMH.dao;

import com.SLJMH.entity.ComplaintProcessLog;
import org.apache.log4j.Priority;

import java.util.List;

/**
 * 投诉处理dao
 */
public interface ComplaintProcessLogDao {


    /**
     * 查询投诉处理记录
     * @param complaintId
     * @return
     */
    List<ComplaintProcessLog> findByComplaintId(long complaintId);

    void save(ComplaintProcessLog log);
}
