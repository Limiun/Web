package com.SLJMH.service;

import java.util.List;

import com.SLJMH.entity.Role;


public interface  RoleService extends  BaseService<Role> {

	int findByUserId(Integer userId);

	void saveUserId(Integer userId);

	void deleteById(int parseInt);

	Role findById(int id);


}
