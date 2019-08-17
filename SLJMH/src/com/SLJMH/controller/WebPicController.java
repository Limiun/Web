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

import com.SLJMH.entity.Pics;
import com.SLJMH.service.PicService;

@WebServlet(value = "/WebPicServlet")
public class WebPicController extends HttpServlet {

	private PicService   picServiceImpl;
	private ApplicationContext applicationContext;
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		picServiceImpl = (PicService) applicationContext.getBean("PicServiceImpl");
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		if("add".equals(request.getParameter("webpic"))){
			Pics pic=new Pics();
			pic.setPicSourceUrl(request.getParameter("picSourceUrl"));
			pic.setPicUrl(request.getParameter("picUrl"));
			pic.setPicInfo1(request.getParameter("picInfo1"));
			pic.setPicInfo2(request.getParameter("picInfo2"));
			pic.setPicInfo3(request.getParameter("picInfo3"));
			picServiceImpl.save(pic);
			
			List<Pics>  pList =picServiceImpl.findAll("Pics");
			request.getSession().setAttribute("Pics", pList);
			response.sendRedirect("manager/webpic.jsp");
		}//if  add
		
		if("list".equals(request.getParameter("webpic"))){
			List<Pics>  pList =picServiceImpl.findAll("Pics");
			request.getSession().setAttribute("Pics", pList);
			response.sendRedirect("manager/webpic.jsp");
		}
		if("update".equals(request.getParameter("webpic"))){
			Pics pic=picServiceImpl.findById(Integer.parseInt(request.getParameter("picId")));
			
			pic.setPicSourceUrl(request.getParameter("picSourceUrl"));
			pic.setPicUrl(request.getParameter("picUrl"));
			pic.setPicInfo1(request.getParameter("picInfo1"));
			pic.setPicInfo2(request.getParameter("picInfo2"));
			pic.setPicInfo3(request.getParameter("picInfo3"));
			picServiceImpl.update(pic);
			List<Pics>  pList =picServiceImpl.findAll("Pics");
			request.getSession().setAttribute("Pics", pList);
			response.sendRedirect("manager/webpic.jsp");
		}
		
		
		if("delete".equals(request.getParameter("webpic"))){
			
			Pics pic=picServiceImpl.findById(Integer.parseInt(request.getParameter("picId")));
			picServiceImpl.delete(pic);
			List<Pics>  pList =picServiceImpl.findAll("Pics");
			request.getSession().setAttribute("Pics", pList);
			response.sendRedirect("manager/webpic.jsp");
		}
		
		

	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

