package com.SLJMH.dao.impl;



import java.io.File;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.SLJMH.dao.PicDao;
import com.SLJMH.entity.Pics;



public class PicDaoImpl extends BaseDaoImpl<Pics> implements PicDao{

	@Override
	public Pics deleteById(Integer id) {
		// TODO Auto-generated method stub
		 List<Pics> pList=getHibernateTemplate().find("from  Pics where PicId="+id);
		 if(pList.size()>0){
			 return    pList.get(0);
		 }else{
			 return new Pics();
		 }
		
	}

		
	
	
	
	
	
	
	
		 
	}
	


	
