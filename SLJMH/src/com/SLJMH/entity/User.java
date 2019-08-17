package com.SLJMH.entity;

public class User {

	private Integer userId;	

	private String userName;

	private String userNickName;

	private String userPassWord;

	private String userEmail;

	private String userPic;
	
	private String userIdentify;
	
	private String userTrueName;
	
	private String userBirthday;
	
	private String userSex;
	
	private String userStar;
	
	private String userBlood;
	
	private String userCharacter;
	
	private String userHobby;
	
	private String userJob;
	
	//private String userRole;
	
	private String userStateReason;
	
	public String getUserIdentify() {
		return userIdentify;
	}

	public void setUserIdentify(String userIdentify) {
		this.userIdentify = userIdentify;
	}

	public String getUserTrueName() {
		return userTrueName;
	}

	public void setUserTrueName(String userTrueName) {
		this.userTrueName = userTrueName;
	}

	public String getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public String getUserStar() {
		return userStar;
	}

	public void setUserStar(String userStar) {
		this.userStar = userStar;
	}

	public String getUserBlood() {
		return userBlood;
	}

	public void setUserBlood(String userBlood) {
		this.userBlood = userBlood;
	}

	public String getUserCharacter() {
		return userCharacter;
	}

	public void setUserCharacter(String userCharacter) {
		this.userCharacter = userCharacter;
	}

	public String getUserHobby() {
		return userHobby;
	}

	public void setUserHobby(String userHobby) {
		this.userHobby = userHobby;
	}

	public String getUserJob() {
		return userJob;
	}

	public void setUserJob(String userJob) {
		this.userJob = userJob;
	}

	/*public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}*/

	public String getUserStateReason() {
		return userStateReason;
	}

	public void setUserStateReason(String userStateReason) {
		this.userStateReason = userStateReason;
	}

	public Integer getUserId() {
	return userId;

	}

	public void setUserId(Integer userId) {
	this.userId = userId;

	}

	public String getUserName() {
	return userName;

	}

	public void setUserName(String userName) {
	this.userName = userName;

	}

	public String getUserNickName() {
	return userNickName;

	}

	public void setUserNickName(String userNickName) {

		this.userNickName = userNickName;

	}

	public String getUserPassWord() {
	return userPassWord;

	}

	public void setUserPassWord(String userPassWord) {
	this.userPassWord = userPassWord;

	}

	public String getUserEmail() {
	return userEmail;

	}

	public void setUserEmail(String userEmail) {
	this.userEmail = userEmail;

	}

	@Override

	public String toString() {
	return "User [userId=" + userId + ", userName=" + userName
			+ ", userNickName=" + userNickName + ", userPassWord="
			+ userPassWord + ", userEmail=" + userEmail 
			+  "]";

	}

	public String getUserPic() {
	return userPic;

	}

	public void setUserPic(String userPic) {
	this.userPic = userPic;

	}


}
