package com.SLJMH.dao.impl;



import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.SLJMH.dao.BlogDao;
import com.SLJMH.entity.Blog;




public class BlogDaoImpl extends BaseDaoImpl<Blog> implements BlogDao{

	@Override
	public Blog findById(int id) {
		// TODO Auto-generated method stub
		List<Blog> blogList=getHibernateTemplate().find("from com.SLJMH.entity.Blog where blogId="+id);
		 if(blogList.size()>0){
			 return  blogList.get(0);
		 }else{
			 return  new Blog();
		 }
		
	}

	
	public Blog findByuserName(String userName) {
		// TODO Auto-generated method stub
		List<Blog> blogList=getHibernateTemplate().find("from com.SLJMH.entity.Blog where bloguserName="+userName);
		 if(blogList.size()>0){
			 return  blogList.get(0);
		 }else{
			 return  new Blog();
		 }
		
	}


	


	
}
