package com.SLJMH.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.SLJMH.entity.User;
import com.SLJMH.service.MenuService;
import com.SLJMH.service.UserService;
import com.SLJMH.utils.InitAdminPage;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet(value = "/InitServlet")
public class InitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicationContext applicationContext;
	private User user;
	private UserService userServiceImpl;
	private MenuService menuServiceImpl;
	private final Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
        user=(User) applicationContext.getBean("User");
		userServiceImpl = (UserService) applicationContext.getBean("UserServiceImpl");
		
		
	}

	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		 //初始化页面
		 // 首先加载菜单 团队状态  消息 邮件  最好在ININT中实现
		 InitAdminPage initAdminPage= userServiceImpl.initAdminPage(user);
		 request.getSession().setAttribute("initAdminPage", initAdminPage);
		 
		 
						
		 }

	

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	  
	  
	  
	public void setUser(User user) {
		this.user = user;
	}

	public void setUserServiceImpl(UserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}


}

