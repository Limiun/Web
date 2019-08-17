package com.SLJMH.service.impl;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanNameAware;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.transaction.support.TransactionTemplate;

import com.SLJMH.dao.UserDao;
import com.SLJMH.dao.impl.UserDaoImpl;
import com.SLJMH.entity.User;
import com.SLJMH.service.UserService;
import com.SLJMH.utils.InitAdminPage;


public class UserServiceImpl extends BaseServiceImpl<User> implements
		BeanNameAware, ApplicationContextAware,InitializingBean,DisposableBean,UserService {
	
	private UserDao userDaoImpl = null;
	public void setUserDaoImpl(UserDaoImpl userDaoImpl) {
		 super.setBaseDaoImpl(userDaoImpl);   
		// 测试区域开始
		System.out.println("生命周期第二步:<UserServiceImpl>属性注入");
		// 测试区域结束
		this.userDaoImpl = userDaoImpl;
	}

	// 测试区域开始

	public UserServiceImpl() {
		System.out.println("生命周期第一步:实例化<UserServiceImpl>");
	}

	@Override
	public void setBeanName(String arg0) {
		// TODO Auto-generated method stub
		System.out.println("生命周期第三步:注入类的名称"+arg0);
	}

	@Override
	public void setApplicationContext(ApplicationContext arg1)
			throws BeansException {
		// TODO Auto-generated method stub
		System.out.println("生命周期第四步:注入ApplicationContext"+arg1);
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("生命周期第六步:<UserServiceImpl>属性设置后执行...");
	}
	public void setup() {
		// TODO Auto-generated method stub
		System.out.println("生命周期第七步:<UserServiceImpl>调用手动设置的初始化方法...");
	}
	
	@Override
	public void destroy() throws Exception {
		// TODO Auto-generated method stub
		 System.out.println("生命周期第十步:<UserServiceImpl>调用销毁的方法...");
	}
	public void down() {
		// TODO Auto-generated method stub
		System.out.println("生命周期第十一步:<UserServiceImpl>手动调用销毁的方法...");
	}

	@Override
	public User findEmail(String email) {
		// TODO 使用Spring的自动AOP对方法增强
		return userDaoImpl.findEmail(email);
	}

	@Override
	public User LoginCheck(String email, String pass) {
		// TODO 使用AspectJ注释的方法对其进行增强
		return userDaoImpl.LoginCheck(email,pass);
	}


	@Override
	public InitAdminPage initAdminPage(User user) {
		// TODO Auto-generated method stub
		return userDaoImpl.initAdminPage(user);
	}

	@Override
	public User findById(int id) {
		// TODO Auto-generated method stub
		return userDaoImpl.findById(id);
	}

	@Override
	public void updateRoleId(int roleId, Integer userId) {
		// TODO Auto-generated method stub
		userDaoImpl.updateRoleId(roleId,userId);
	}

	@Override
	public void deleteRoleId(Integer userId) {
		// TODO Auto-generated method stub
		userDaoImpl.deleteRoleId(userId);
	}




}
