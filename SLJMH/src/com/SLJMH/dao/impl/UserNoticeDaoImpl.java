package com.SLJMH.dao.impl;



import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.SLJMH.dao.UserNoticeDao;
import com.SLJMH.entity.UserNotice;



public class UserNoticeDaoImpl extends BaseDaoImpl<UserNotice> implements UserNoticeDao{

	@Override
	public List<UserNotice> findAllByUserId(int id) {
		// TODO Auto-generated method stub
		
		List<UserNotice> userNotice=getHibernateTemplate().find("from com.SLJMH.entity.UserNotice where userid="+id);
		 if(userNotice.size()>0){
			 return  userNotice;
		 }else{
			 return new ArrayList<UserNotice>();
		 }
	}

	@Override
	public UserNotice findById(int id) {
		// TODO Auto-generated method stub
		List<UserNotice> userNoticeList=getHibernateTemplate().find("from com.SLJMH.entity.UserNotice where id="+id);
		if(userNoticeList.size()>0){
			return  userNoticeList.get(0);
		}else{
			return  new UserNotice();
		}
		
	}

	@Override
	public List<UserNotice> findNoReadById(Integer userId) {
		// TODO Auto-generated method stub
		List<UserNotice> userNotice=getHibernateTemplate().find("from com.SLJMH.entity.UserNotice where noticestate='0' and userid="+userId);
		 if(userNotice.size()>0){
			 return  userNotice;
		 }else{
			 return new ArrayList<UserNotice>();
		 }
	}
	
	



	
}
