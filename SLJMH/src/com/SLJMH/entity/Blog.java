package com.SLJMH.entity;



public class Blog {
private Integer blogId;
private String  blogTitle;	
private String  blogTag;
private String  blogSummary;
private String  blogDate;
private String  blogContent;
private String  blogBackPic;
private String  bloguserName;
private Integer bloguserId;

public Integer getBloguserId() {
	return bloguserId;
}
public void setBloguserId(Integer bloguserId) {
	this.bloguserId = bloguserId;
}
public Integer getBlogId() {
	return blogId;
}
public String getBlogTitle() {
	return blogTitle;
}
public String getBlogTag() {
	return blogTag;
}
public String getBlogSummary() {
	return blogSummary;
}
public String getBlogDate() {
	return blogDate;
}
public String getBlogContent() {
	return blogContent;
}
public String getBlogBackPic() {
	return blogBackPic;
}
public void setBlogId(Integer blogId) {
	this.blogId = blogId;
}
public void setBlogTitle(String blogTitle) {
	this.blogTitle = blogTitle;
}
public void setBlogTag(String blogTag) {
	this.blogTag = blogTag;
}
public void setBlogSummary(String blogSummary) {
	this.blogSummary = blogSummary;
}
public void setBlogDate(String blogDate) {
	this.blogDate = blogDate;
}
public void setBlogContent(String blogContent) {
	this.blogContent = blogContent;
}
public void setBlogBackPic(String blogBackPic) {
	this.blogBackPic = blogBackPic;
}
public String getBloguserName() {
	return bloguserName;
}
public void setBloguserName(String bloguserName) {
	this.bloguserName = bloguserName;
}


}
