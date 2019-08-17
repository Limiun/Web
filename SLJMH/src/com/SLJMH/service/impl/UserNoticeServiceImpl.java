package com.SLJMH.service.impl;


import java.util.List;

import com.SLJMH.dao.UserNoticeDao;
import com.SLJMH.dao.impl.UserNoticeDaoImpl;
import com.SLJMH.entity.UserNotice;
import com.SLJMH.service.UserNoticeService;


public class UserNoticeServiceImpl extends BaseServiceImpl<UserNotice> implements UserNoticeService {
	
	private UserNoticeDao userNoticeDaoImpl = null;
	public void setUserNoticeDaoImpl(UserNoticeDaoImpl userNoticeDaoImpl) {
		 super.setBaseDaoImpl(userNoticeDaoImpl);   
		 this.userNoticeDaoImpl = userNoticeDaoImpl;
	}
	@Override
	public List<UserNotice> findAllByUserId(int id) {
		// TODO Auto-generated method stub
		return userNoticeDaoImpl.findAllByUserId(id);
	}
	@Override
	public UserNotice findById(int id) {
		// TODO Auto-generated method stub
		return userNoticeDaoImpl.findById(id);
	}
	@Override
	public List<UserNotice> findNoReadById(Integer userId) {
		// TODO Auto-generated method stub
		return userNoticeDaoImpl.findNoReadById(userId);
	}







}
