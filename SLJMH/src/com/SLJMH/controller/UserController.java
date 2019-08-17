package com.SLJMH.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.SLJMH.entity.Role;
import com.SLJMH.entity.User;
import com.SLJMH.service.RoleService;
import com.SLJMH.service.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet(value = "/UserServlet")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicationContext applicationContext;
	private UserService userServiceImpl;
	private RoleService roleServiceImpl;
	private final Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		userServiceImpl = (UserService) applicationContext.getBean("UserServiceImpl");
		roleServiceImpl = (RoleService) applicationContext.getBean("RoleServiceImpl");
	}

	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
        
		
		//获取用户列表
		if("list".equals(request.getParameter("user"))){
			 List<Role>  roleList =  roleServiceImpl.findAll("Role");
			 request.getSession().setAttribute("roleList", roleList);
	      }
		//修改个人信息
		if("update".equals(request.getParameter("user"))){
			 User user= userServiceImpl.findById(Integer.parseInt(request.getParameter("userId")));
			 user.setUserName(request.getParameter("userName"));
			 user.setUserNickName(request.getParameter("userNickName"));
			 user.setUserEmail(request.getParameter("userEmail"));
			 user.setUserPassWord(request.getParameter("userPassWord"));
			 user.setUserPic(request.getParameter("userPic"));
			 user.setUserIdentify(request.getParameter("userIdentify"));
			 user.setUserTrueName(request.getParameter("userTrueName"));
			 user.setUserBirthday(request.getParameter("userBirthday"));
			 user.setUserSex(request.getParameter("userSex"));
			 user.setUserStar(request.getParameter("userStar"));
			 user.setUserBlood(request.getParameter("userBlood"));
			 user.setUserCharacter(request.getParameter("userCharacter"));
			 user.setUserHobby(request.getParameter("userHobby"));
			 user.setUserJob(request.getParameter("userJob"));
			 //user.setUserRole(request.getParameter("userRole"));
			 user.setUserStateReason(request.getParameter("userStateReason"));
			 
			 
			 userServiceImpl.update(user);
			   if(request.getParameter("userRole")!=null){
				   int roleId=Integer.parseInt(request.getParameter("userRole"));
					 userServiceImpl.updateRoleId(roleId,user.getUserId());
			   }
			
			 
	     }
		//删除用户，目前不需要
		if("delete".equals(request.getParameter("user"))){
			 User user= userServiceImpl.findById(Integer.parseInt(request.getParameter("userId")));
			 userServiceImpl.delete(user);
			 userServiceImpl.deleteRoleId(user.getUserId());
	     }
		 
		
		 List<User>  userList =  userServiceImpl.findAll("User");
		 request.getSession().setAttribute("userList", userList);
	     if("index".equals(request.getParameter("toJsp"))){
	    	 User user= userServiceImpl.findById(Integer.parseInt(request.getParameter("userId")));
	    	    request.getSession().setAttribute("user", user);
	    	    response.sendRedirect("manager/admin_Index.jsp");
	     }else{
	    	    response.sendRedirect("manager/userview.jsp");
	     }
		
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	  
	  //打印列表
	public static  List<Integer> ToInts(String abc){  
		  
		 String[] arr=abc.split(",");
		 Integer[] result = new Integer[arr.length];  
		 
		 for (int i = 0; i <arr.length; i++) {  
			 String str = arr[i];  
			 result[i] = Integer.valueOf(str);
			 }   
		 return java.util.Arrays.asList(result);  
		}  
	  


}

