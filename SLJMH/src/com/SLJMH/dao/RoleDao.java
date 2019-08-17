package com.SLJMH.dao;

import com.SLJMH.entity.Role;

public interface RoleDao extends BaseDao<Role> {

	int findByUserId(Integer userId);

	//设置默认权限状态
	void saveUserId(Integer userId);

	//删除该状态下的所有用户
	void deleteById(int id);
	
	Role findById(int id);
}
