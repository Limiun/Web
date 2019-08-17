package com.SLJMH.dao;

import com.SLJMH.entity.Blog;

public interface BlogDao extends BaseDao<Blog> {

	Blog findById(int id);
	Blog findByuserName(String userName);



}
