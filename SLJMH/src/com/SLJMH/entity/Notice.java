package com.SLJMH.entity;

import java.util.List;

public class Notice {
	private Integer noticeId;
private String  noticeTitle;	
public String getNoticeTitle() {
	return noticeTitle;
}
public void setNoticeTitle(String noticeTitle) {
	this.noticeTitle = noticeTitle;
}
public String getNoticeDate() {
	return noticeDate;
}
public void setNoticeDate(String noticeDate) {
	this.noticeDate = noticeDate;
}
public String getNoticeContent() {
	return noticeContent;
}
public void setNoticeContent(String noticeContent) {
	this.noticeContent = noticeContent;
}
public List<Integer> getUserId() {
	return userId;
}
public void setUserId(List<Integer> userId) {
	this.userId = userId;
}
public Integer getNoticeId() {
	return noticeId;
}
public void setNoticeId(Integer noticeId) {
	this.noticeId = noticeId;
}
private String  noticeDate;
private String  noticeContent;
private List<Integer> userId;


}
