package com.SLJMH.dao;

import com.SLJMH.entity.User;
import com.SLJMH.utils.InitAdminPage;

public interface UserDao extends BaseDao<User> {
	//通过邮箱查找用户
	public User findEmail(String email);
	//审核用户登录状态
	public User LoginCheck(String email, String pass) ;
	
	public InitAdminPage initAdminPage(User user);
	//通过userid查找用户
	public User findById(int id);
	//修改权限
	public void updateRoleId(int roleId, Integer userId);
	
	public void deleteRoleId(Integer userId);
	//通过username查找user
    User findByUserName(String userName);
}
