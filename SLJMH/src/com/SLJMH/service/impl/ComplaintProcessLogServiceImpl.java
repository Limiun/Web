package com.SLJMH.service.impl;

import com.SLJMH.dao.ComplaintProcessLogDao;
import com.SLJMH.entity.ComplaintProcessLog;
import com.SLJMH.service.ComplaintProcessLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 投诉处理记录服务类
 */
@Service
public class ComplaintProcessLogServiceImpl implements ComplaintProcessLogService {

    @Autowired
    private ComplaintProcessLogDao processLogDao;

    @Override
    public List<ComplaintProcessLog> findByComplaintId(long complaintId) {
        return processLogDao.findByComplaintId(complaintId);
    }
}
