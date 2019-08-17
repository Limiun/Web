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
import com.SLJMH.service.RoleService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet(value = "/RoleServlet")
public class RoleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicationContext applicationContext;
	private RoleService roleServiceImpl;
	private final Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		roleServiceImpl = (RoleService) applicationContext.getBean("RoleServiceImpl");
	}

	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		//角色权限状态列表
		if("list".equals(request.getParameter("role"))){
		    List<Role>  roleList =  roleServiceImpl.findAll("Role");
		    request.getSession().setAttribute("roleList", roleList);
			
	      }
		
		if("add".equals(request.getParameter("role"))){
			Role role=new Role();
			role.setRoleName(request.getParameter("roleName"));
			role.setRoleDesc(request.getParameter("roleDesc"));
			List<Integer> roleMenus =ToInts(request.getParameter("roleMenus"));
			role.setRoleMenus(roleMenus);
			roleServiceImpl.save(role);
	      }
		if("delete".equals(request.getParameter("role"))){
			 roleServiceImpl.deleteById(Integer.parseInt(request.getParameter("roleId")));
			
	     }
		if("update".equals(request.getParameter("role"))){
			 Role role= roleServiceImpl.findById(Integer.parseInt(request.getParameter("roleId")));
			 role.setRoleName(request.getParameter("roleName"));
			 role.setRoleDesc(request.getParameter("roleDesc"));
			 List<Integer> roleMenus =ToInts(request.getParameter("roleMenus"));
			 role.setRoleMenus(roleMenus);
			 roleServiceImpl.update(role);
	     }
		 List<Role>  roleList =  roleServiceImpl.findAll("Role");
		 request.getSession().setAttribute("roleList", roleList);
		 response.sendRedirect("manager/roleview.jsp");
		
		
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

