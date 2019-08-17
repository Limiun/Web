package com.SLJMH.service;

import com.SLJMH.entity.User;
import com.SLJMH.utils.InitAdminPage;

public interface  UserService extends  BaseService<User> {
	 public User findEmail(String email);

	public User LoginCheck(String email, String pass);

	public InitAdminPage initAdminPage(User user);

	public User findById(int parseInt);

	public void updateRoleId(int roleId, Integer userId);

	public void deleteRoleId(Integer userId);
}
