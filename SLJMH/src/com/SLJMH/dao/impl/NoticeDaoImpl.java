package com.SLJMH.dao.impl;



import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.SLJMH.dao.NoticeDao;
import com.SLJMH.entity.Notice;




public class NoticeDaoImpl extends BaseDaoImpl<Notice> implements NoticeDao{

	@Override
	public Notice findById(int id) {
		// TODO Auto-generated method stub
		List<Notice> noticeList=getHibernateTemplate().find("from com.SLJMH.entity.Notice where noticeId="+id);
		 if(noticeList.size()>0){
			 return  noticeList.get(0);
		 }else{
			 return  new Notice();
		 }
		
	}



	


	
}
