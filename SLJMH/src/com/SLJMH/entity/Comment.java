package com.SLJMH.entity;

import java.util.Date;

public class Comment {
	public Integer c_id;//评论表id
	private Integer  c_userid;	//评论者id
	private String   c_username;
	private Integer  c_contentid;//在哪个内容下评论，内容标题
	private Date  c_createtime;//评论时间
	private String  c_content;//评论内容
	private Integer  c_otherid;//给谁评论
	private String   c_othername;
	
	public String getC_username() {
		return c_username;
	}
	public void setC_username(String c_username) {
		this.c_username = c_username;
	}
	public String getC_othername() {
		return c_othername;
	}
	public void setC_othername(String c_othername) {
		this.c_othername = c_othername;
	}
	public Integer getC_id() {
		return c_id;
	}
	public void setC_id(Integer c_id) {
		this.c_id = c_id;
	}
	public Integer getC_userid() {
		return c_userid;
	}
	public void setC_userid(Integer c_userid) {
		this.c_userid = c_userid;
	}
	public Integer getC_contentid() {
		return c_contentid;
	}
	public void setC_contentid(Integer c_contentid) {
		this.c_contentid = c_contentid;
	}
	
	public Date getC_createtime() {
		return c_createtime;
	}
	public void setC_createtime(Date c_createtime) {
		this.c_createtime = c_createtime;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public Integer getC_otherid() {
		return c_otherid;
	}
	public void setC_otherid(Integer c_otherid) {
		this.c_otherid = c_otherid;
	}
	
	

	
	
	

}
