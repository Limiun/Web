package com.SLJMH.entity;

public class Reply {
	public Integer r_id;//评论表id
	private Integer  r_userid;	//评论者id
	private Integer  r_contentid;//在哪个内容下评论，内容id
	private String  r_createtime;//评论时间
	private String  r_content;//评论内容
	private Integer  r_otherid;//给谁评论
	private Integer  r_words;//在哪个评论回复
	public Integer getR_id() {
		return r_id;
	}
	public void setR_id(Integer r_id) {
		this.r_id = r_id;
	}
	public Integer getR_userid() {
		return r_userid;
	}
	public void setR_userid(Integer r_userid) {
		this.r_userid = r_userid;
	}
	public Integer getR_contentid() {
		return r_contentid;
	}
	public void setR_contentid(Integer r_contentid) {
		this.r_contentid = r_contentid;
	}
	public String getR_createtime() {
		return r_createtime;
	}
	public void setR_createtime(String r_createtime) {
		this.r_createtime = r_createtime;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Integer getR_otherid() {
		return r_otherid;
	}
	public void setR_otherid(Integer r_otherid) {
		this.r_otherid = r_otherid;
	}
	public Integer getR_words() {
		return r_words;
	}
	public void setR_words(Integer r_words) {
		this.r_words = r_words;
	}
	
}
