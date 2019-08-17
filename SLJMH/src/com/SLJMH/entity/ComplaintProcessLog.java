package com.SLJMH.entity;

import java.util.Date;

/**
 * 投诉
 */
public class ComplaintProcessLog {

    /**
     * 主键
     */
    private Long id;
    /**
     * 投诉id
     */
    private Long complaintId;

    /**
     * 处理对象类型
     */
    private int processType;

    /**
     * 处理时间
     */
    private Date processTime;

    /**
     * 处理方式
     */
    private int processResult;

    /**
     * 处理原因
     */
    private String processReason;

    /**
     * 处理人id
     */
    private int processUserId;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getComplaintId() {
        return complaintId;
    }

    public void setComplaintId(Long complaintId) {
        this.complaintId = complaintId;
    }

    public int getProcessType() {
        return processType;
    }

    public void setProcessType(int processType) {
        this.processType = processType;
    }

    public Date getProcessTime() {
        return processTime;
    }

    public void setProcessTime(Date processTime) {
        this.processTime = processTime;
    }

    public int getProcessResult() {
        return processResult;
    }

    public void setProcessResult(int processResult) {
        this.processResult = processResult;
    }

    public String getProcessReason() {
        return processReason;
    }

    public void setProcessReason(String processReason) {
        this.processReason = processReason;
    }

    public int getProcessUserId() {
        return processUserId;
    }

    public void setProcessUserId(int processUserId) {
        this.processUserId = processUserId;
    }

    @Override
    public String toString() {
        return new org.apache.commons.lang.builder.ToStringBuilder(this)
                .append("id", id)
                .append("complaintId", complaintId)
                .append("processType", processType)
                .append("processTime", processTime)
                .append("processResult", processResult)
                .append("processReason", processReason)
                .append("processUserId", processUserId)
                .toString();
    }
}
