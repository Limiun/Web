package com.SLJMH.service;

import com.SLJMH.entity.Blog;

public interface  BlogService extends  BaseService<Blog> {

	Blog findById(int parseInt);
	


}
