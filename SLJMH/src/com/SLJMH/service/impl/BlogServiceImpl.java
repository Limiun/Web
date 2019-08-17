package com.SLJMH.service.impl;

import com.SLJMH.dao.BlogDao;
import com.SLJMH.dao.impl.BlogDaoImpl;
import com.SLJMH.entity.Blog;
import com.SLJMH.service.BlogService;

public class BlogServiceImpl extends BaseServiceImpl<Blog> implements BlogService {
	
	private BlogDao blogDaoImpl = null;
	public void setBlogDaoImpl(BlogDaoImpl blogDaoImpl) {
		 super.setBaseDaoImpl(blogDaoImpl);   
		 this.blogDaoImpl = blogDaoImpl;
	}
	@Override
	public Blog findById(int id) {
		// TODO Auto-generated method stub
		return blogDaoImpl.findById(id);
	}

	public Blog findByuserName(String userName) {
		// TODO Auto-generated method stub
		return blogDaoImpl.findByuserName(userName);
	}






}
