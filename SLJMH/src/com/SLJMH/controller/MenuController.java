package com.SLJMH.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.SLJMH.entity.Ico;
import com.SLJMH.entity.Menu;
import com.SLJMH.service.IcoService;
import com.SLJMH.service.MenuService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet(value = "/MenuServlet")
public class MenuController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicationContext applicationContext;
	private MenuService menuServiceImpl;
	private IcoService icoServiceImpl;
	private final Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		menuServiceImpl = (MenuService) applicationContext.getBean("MenuServiceImpl");
		icoServiceImpl = (IcoService) applicationContext.getBean("IcoServiceImpl");
	}

	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
	
		
		if("ajax".equals(request.getParameter("menu"))){
			List<Menu>  menuList = menuServiceImpl.findAll("Menu");
			for(int i = 0 ; i < menuList.size() ; i++) {
			      if(menuList.get(i).getChildMenus()!=null){
			    	  menuList.get(i).getChildMenus().clear();
			      }
			} 
			 response.getWriter().print(gson.toJson(menuList));
	   }else{
		 //管理员管理的菜单列表
		   if("list".equals(request.getParameter("menu"))){
			    List<Ico>  icoList =  icoServiceImpl.findAll("Ico");
			    request.getSession().setAttribute("icoList", icoList);
		      }
			
			if("delete".equals(request.getParameter("menu"))){
				 menuServiceImpl.deleteById(Integer.parseInt(request.getParameter("menuId")));
		     }
			
			if("add".equals(request.getParameter("menu"))){
				Menu menu=new Menu();
				menu.setMenuName(request.getParameter("menuName"));
				menu.setMenuFather(Integer.parseInt(request.getParameter("menuFather")));
			    menu.setMenuUrl(request.getParameter("menuUrl"));
			    menu.setMenuPic(request.getParameter("menuPic"));
			    if("".equals(request.getParameter("menuOrder"))){
			    	menu.setMenuOrder(0);
			    }else{
			    	menu.setMenuOrder(Integer.valueOf(request.getParameter("menuOrder")));
			    }
			    menu.setChildMenus(new ArrayList<Menu>());
			    menuServiceImpl.save(menu);
			    //查看父菜单： 父菜单的父菜单为0，父菜单是一级菜单，本菜单是二级菜单
			    Menu fmenu=(Menu) menuServiceImpl.findById(Integer.parseInt(request.getParameter("menuFather")));
			    //如果不是一级菜单
			     if(fmenu.getMenuId()!=1){
			    	  fmenu.getChildMenus().add(menu);
					  menuServiceImpl.update(fmenu);
			     }       
			}
			
			if("update".equals(request.getParameter("menu"))){
				Menu menu= menuServiceImpl.findById(Integer.parseInt(request.getParameter("menuId")));
				menu.setMenuName(request.getParameter("menuName"));
			    menu.setMenuUrl(request.getParameter("menuUrl"));
			    menu.setMenuPic(request.getParameter("menuPic"));
			    if("".equals(request.getParameter("menuOrder"))){
			    	menu.setMenuOrder(0);
			    }else{
			    	menu.setMenuOrder(Integer.valueOf(request.getParameter("menuOrder")));
			    }
			    
			    menuServiceImpl.update(menu);
			}
			List<Menu>   menuList =  menuServiceImpl.findAll("Menu");
		    request.getSession().setAttribute("userMenuList", menuList);
			response.sendRedirect("manager/menuview.jsp");
	  }
		
		
		
		
		
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	  
	  
	  
	  


}
