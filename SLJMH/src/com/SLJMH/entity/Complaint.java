package com.SLJMH.entity;

import java.util.Date;

/**
 * 投诉
 */
public class Complaint {

    /**
     * 主键
     */
    private Long id;
    /**
     * 用户id
     */
    private Long userId;

    /**
     * 用户名
     */
    private String userName;

    /**
     * 用户id
     */
    private Long complaintedUserId;

    /**
     * 用户名
     */
    private String complaintedUserName;

    /**
     * 投诉类型
     */
    private int complaintType;
    /**
     * 投诉描述
     */
    private String complaintDesc;

    /**
     * 附件名称
     */
    private String attachmentName;

    /**
     * 附件地址
     */
    private String attachmentPath;

    /**
     * 申诉时间
     */
    private Date appealTime;

    /**
     * 申诉理由
     */
    private String appealReason;
    /**
     * 投诉时间
     */
    private Date complaintTime;

    /**
     * 处理状态
     */
    private int processStatus;

    /**
     * 投诉目标
     */
    private Integer complaintTargetId;

    public String getAppealReason() {
        return appealReason;
    }

    public void setAppealReason(String appealReason) {
        this.appealReason = appealReason;
    }

    

    public Integer getComplaintTargetId() {
		return complaintTargetId;
	}

	public void setComplaintTargetId(Integer complaintTargetId) {
		this.complaintTargetId = complaintTargetId;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Long getComplaintedUserId() {
        return complaintedUserId;
    }

    public void setComplaintedUserId(Long complaintedUserId) {
        this.complaintedUserId = complaintedUserId;
    }

    public String getComplaintedUserName() {
        return complaintedUserName;
    }

    public void setComplaintedUserName(String complaintedUserName) {
        this.complaintedUserName = complaintedUserName;
    }

    public int getComplaintType() {
        return complaintType;
    }

    public void setComplaintType(int complaintType) {
        this.complaintType = complaintType;
    }

    public String getComplaintDesc() {
        return complaintDesc;
    }

    public void setComplaintDesc(String complaintDesc) {
        this.complaintDesc = complaintDesc;
    }

    public String getAttachmentName() {
        return attachmentName;
    }

    public void setAttachmentName(String attachmentName) {
        this.attachmentName = attachmentName;
    }

    public String getAttachmentPath() {
        return attachmentPath;
    }

    public void setAttachmentPath(String attachmentPath) {
        this.attachmentPath = attachmentPath;
    }

    public Date getAppealTime() {
        return appealTime;
    }

    public void setAppealTime(Date appealTime) {
        this.appealTime = appealTime;
    }

    public Date getComplaintTime() {
        return complaintTime;
    }

    public void setComplaintTime(Date complaintTime) {
        this.complaintTime = complaintTime;
    }

    public int getProcessStatus() {
        return processStatus;
    }

    public void setProcessStatus(int processStatus) {
        this.processStatus = processStatus;
    }

    @Override
    public String toString() {
        return new org.apache.commons.lang.builder.ToStringBuilder(this)
                .append("id", id)
                .append("userId", userId)
                .append("userName", userName)
                .append("complaintedUserId", complaintedUserId)
                .append("complaintedUserName", complaintedUserName)
                .append("complaintType", complaintType)
                .append("complaintDesc", complaintDesc)
                .append("attachmentName", attachmentName)
                .append("attachmentPath", attachmentPath)
                .append("appealTime", appealTime)
                .append("complaintTime", complaintTime)
                .append("processStatus", processStatus)
                .toString();
    }
}
