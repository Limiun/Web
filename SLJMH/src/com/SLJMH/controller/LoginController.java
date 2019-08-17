package com.SLJMH.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.SLJMH.entity.Menu;
import com.SLJMH.entity.User;
import com.SLJMH.entity.UserNotice;
import com.SLJMH.service.MenuService;
import com.SLJMH.service.NoticeService;
import com.SLJMH.service.RoleService;
import com.SLJMH.service.UserNoticeService;
import com.SLJMH.service.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet(value = "/LoginServlet")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicationContext applicationContext;
	private User user;
	private UserService userServiceImpl;
	private MenuService menuServiceImpl;
	private RoleService roleServiceImpl;
	private NoticeService noticeServiceImpl;
	private UserNoticeService userNoticeServiceImpl;
	private final Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		userServiceImpl = (UserService) applicationContext.getBean("UserServiceImpl");
		menuServiceImpl = (MenuService) applicationContext.getBean("MenuServiceImpl");
		roleServiceImpl = (RoleService) applicationContext.getBean("RoleServiceImpl");
		noticeServiceImpl = (NoticeService) applicationContext.getBean("NoticeServiceImpl");
		userNoticeServiceImpl = (UserNoticeService) applicationContext.getBean("UserNoticeServiceImpl");
	}

	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		//这里会有两个请求，第一个是ajax第二个是表单的提交；ajax提交过来的数据不要提交表单，仅仅作为验证
		
		
		if("ajax".equals(request.getParameter("flag"))){
	     user=userServiceImpl.LoginCheck(request.getParameter("userEmail"),request.getParameter("userPassWord"));
	     if(user.getUserId() == null){
	       	     response.setContentType("text/html;charset=UTF-8");
	  		     response.getWriter().write("Email/PassWord Error！");
			 }
		}
		//开始处理第二个请求
	     else{
		 			   	    	 		   	    	 
		   	    	 //注销
		   	    	  if("reset".equals(request.getParameter("set"))){
			   			 Enumeration em = request.getSession().getAttributeNames();
			   		         while(em.hasMoreElements()){
			   		          request.getSession().removeAttribute(em.nextElement().toString());
			   		     }
			   			     response.sendRedirect("PreFormServlet");
			   			   
				     	}else{
					    
						//处理重复提交  	
					     boolean b = isRepeatSubmit(request);
						 if(b==true){        	 
				       	     System.out.println("用户重复提交表单【loginForm】,但是没用…… 哈哈，只接受第一次请求。");
				          }else{
				             System.out.println("登录成功——————");
				   	    	 request.getSession().removeAttribute("token");
				   	    	 List<Menu> menuList = new ArrayList<Menu>();
				   	    	 
				   	    	 int  roleid=roleServiceImpl.findByUserId(user.getUserId());
				   	    
				   	    	 if(roleid==1){
				   	    		 //前台只显示一级菜单,这里的list有重复
				   	    		 menuList =  menuServiceImpl.findAll("Menu");
				   	    		 //预加载消息
				   	    	 }else{
				   	    		 menuList =  menuServiceImpl.findUseMenu(roleid);
				   	    	    //预加载消息
								 List<UserNotice>  noList =userNoticeServiceImpl.findNoReadById(user.getUserId());
								 request.getSession().setAttribute("noList", noList);
				   	    	 }
				   	    	 
		   	    	 
		   	    	 
		             request.getSession().setAttribute("userMenuList", menuList);
		             request.getSession().setAttribute("roleid", roleid);
		             request.getSession().setAttribute("user", user);
		             request.getSession().setAttribute("userid", user.getUserId());
		   		     response.sendRedirect("manager/admin_Index.jsp");
		   	    	 
					}
		   		     
		   		     
		   		     
		   	      
		   	      }
						
				}
		 }

	

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	  private boolean isRepeatSubmit(HttpServletRequest request) {
          String client_token = request.getParameter("token");
          //1、如果用户提交的表单数据中没有token，则用户是重复提交了表单
          if(client_token==null){
        	  System.out.println("1");
              return true;
          }
          //取出存储在Session中的token
          String server_token = (String) request.getSession().getAttribute("token");
          //2、如果当前用户的Session中不存在Token(令牌)，则用户是重复提交了表单
          if(server_token==null){
        	  System.out.println("2");
              return true;
          }
          //3、存储在Session中的Token(令牌)与表单提交的Token(令牌)不同，则用户是重复提交了表单
          if(!client_token.equals(server_token)){
        	  System.out.println("3");
              return true;
          }
          
          return false;
      }
	  
	  
	  
	  
	  
	  
	public void setUser(User user) {
		this.user = user;
	}

	public void setUserServiceImpl(UserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}


}
