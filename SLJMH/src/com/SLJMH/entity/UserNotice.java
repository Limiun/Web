package com.SLJMH.entity;

public class UserNotice {
private Integer userId;	
private Integer id;	
private String noticeDate;
private String noticeState;
public String getNoticeState() {
	return noticeState;
}
public void setNoticeState(String noticeState) {
	this.noticeState = noticeState;
}
public String getNoticeTitle() {
	return noticeTitle;
}
public void setNoticeTitle(String noticeTitle) {
	this.noticeTitle = noticeTitle;
}
public String getNoticeContent() {
	return noticeContent;
}
public void setNoticeContent(String noticeContent) {
	this.noticeContent = noticeContent;
}
private String noticeTitle;
private String noticeContent;
public Integer getUserId() {
	return userId;
}
public void setUserId(Integer userId) {
	this.userId = userId;
}
public String getNoticeDate() {
	return noticeDate;
}
public void setNoticeDate(String noticeDate) {
	this.noticeDate = noticeDate;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
}


}
