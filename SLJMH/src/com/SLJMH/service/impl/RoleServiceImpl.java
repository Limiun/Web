package com.SLJMH.service.impl;

import com.SLJMH.dao.RoleDao;
import com.SLJMH.dao.impl.RoleDaoImpl;
import com.SLJMH.entity.Role;
import com.SLJMH.service.RoleService;

public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {
	
	private RoleDao roleDaoImpl = null;
	public void setRoleDaoImpl(RoleDaoImpl roleDaoImpl) {
		 super.setBaseDaoImpl(roleDaoImpl);   
		 this.roleDaoImpl = roleDaoImpl;
	}
	@Override
	public int findByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return roleDaoImpl.findByUserId(userId);
	}
	@Override
	public void saveUserId(Integer userId) {
		// TODO Auto-generated method stub
		roleDaoImpl.saveUserId(userId);
	}
	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		roleDaoImpl.deleteById(id);
	}
	@Override
	public Role findById(int id) {
		// TODO Auto-generated method stub
		return roleDaoImpl.findById(id);
	}







}
