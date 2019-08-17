package com.SLJMH.dao.impl;



import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.SLJMH.dao.WebInfoDao;
import com.SLJMH.entity.WebInfo;




public class WebInfoDaoImpl extends BaseDaoImpl<WebInfo> implements WebInfoDao{

	@Override
	public WebInfo findById(int id) {
		// TODO Auto-generated method stub
		List<WebInfo> WebInfoList=getHibernateTemplate().find("from com.SLJMH.entity.WebInfo where WebInfoId="+id);
		 if(WebInfoList.size()>0){
			 return  WebInfoList.get(0);
		 }else{
			 return  new WebInfo();
		 }
		
	}



	


	
}
