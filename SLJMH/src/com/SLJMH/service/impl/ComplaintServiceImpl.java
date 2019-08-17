package com.SLJMH.service.impl;

import com.SLJMH.dao.ComplaintDao;
import com.SLJMH.dao.ComplaintProcessLogDao;
import com.SLJMH.dao.UserDao;
import com.SLJMH.entity.Complaint;
import com.SLJMH.entity.ComplaintProcessLog;
import com.SLJMH.entity.User;
import com.SLJMH.service.ComplaintService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 投诉服务类
 */
@Service
public class ComplaintServiceImpl implements ComplaintService {

    @Autowired
    private ComplaintDao complaintDao;

    @Autowired
    private UserDao userDao;

    @Autowired
    private ComplaintProcessLogDao processLogDao;

    @Override
    public List<Complaint> findByComplaintedUserId(long userId) {
        return complaintDao.findByComplaintedUserId(userId);
    }

    @Override
    public void createComplaint(Complaint complaint) {
        User currUser = userDao.findById(complaint.getUserId().intValue());
        complaint.setUserName(currUser.getUserName());
        User complaintedUser = userDao.findByUserName(complaint.getComplaintedUserName());
        if(complaintedUser == null){
            throw new IllegalArgumentException("被投诉用户不存在");
        }
        complaint.setComplaintedUserId(complaintedUser .getUserId().longValue());
        complaint.setComplaintedUserName(complaintedUser.getUserName());
        complaint.setComplaintTime(new Date());
        
        if(complaint.getComplaintType() == 0){
            complaint.setComplaintTargetId(complaintedUser.getUserId());
        }


        complaint.setProcessStatus(0);

        complaintDao.save(complaint);
    }

    @Override
    public void appeal(long id,String appealReason) {
        Complaint complaint = complaintDao.get(id);
        complaint.setAppealTime(new Date());
        complaint.setProcessStatus(3);
        complaint.setAppealReason(appealReason);

        complaintDao.update(complaint);
    }

    @Override
    public List<Complaint> findAll() {
        return complaintDao.findAll();
    }

    @Override
    public void audit(long complaintId,int processUserId, int processResult, String processReason) {
        Complaint complaint = complaintDao.get(complaintId);
        ComplaintProcessLog processLog = new ComplaintProcessLog();
        processLog.setComplaintId(complaintId);
        processLog.setProcessReason(processReason);
        processLog.setProcessResult(processResult);
        processLog.setProcessTime(new Date());
        processLog.setProcessUserId(processUserId);

        if(complaint.getProcessStatus() == 0){
            processLog.setProcessType(0);
            if(processResult == 1){
                complaint.setProcessStatus(2);
            }
            else{
                complaint.setProcessStatus(1);
            }
        }
        else if(complaint.getProcessStatus() == 3){
            processLog.setProcessType(1);
            if(processResult == 1){
                complaint.setProcessStatus(4);
            }
            else{
                complaint.setProcessStatus(5);
            }
        }

        complaintDao.update(complaint);
        processLogDao.save(processLog);
    }
}
