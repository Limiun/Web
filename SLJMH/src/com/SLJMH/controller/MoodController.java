package com.SLJMH.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.SLJMH.entity.Mood;
import com.SLJMH.service.MoodService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet(value = "/MoodServlet")
public class MoodController extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	private ApplicationContext applicationContext;
	private MoodService moodServiceImpl;
	private final Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		moodServiceImpl = (MoodService) applicationContext.getBean("MoodServiceImpl");
	}

	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		
		//心情列表管理
		  if("all".equals(request.getParameter("mood"))){
			 List<Mood>  moodList =  moodServiceImpl.findAll("Mood");
			 if(moodList.size()>0){
				 request.getSession().setAttribute("moodList", moodList);
				 response.sendRedirect("yorbest/mood.jsp");
			 }else{
				 response.sendRedirect("yorbest/index.html");
			 }
			
	 	  }
		  
		  //从朋友圈查看心情具体内容
		  if("detail".equals(request.getParameter("mood"))){
			  
			Mood mood = moodServiceImpl.findById(Integer.parseInt(request.getParameter("moodId")));
			request.getSession().setAttribute("mood", mood);
			response.sendRedirect("yorbest/mood-details.jsp");
		 	 }
		
		//添加心情
		if("add".equals(request.getParameter("mood"))){
			
			if("flag".equals(request.getParameter("flag"))){
			   request.getSession().setAttribute("mood","");
			   response.sendRedirect("manager/moodadd.jsp");
			}else{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");     
				Mood mood=new Mood();
				mood.setMoodDate(sdf.format(new Date()));
				mood.setMoodTitle(request.getParameter("moodTitle"));
				mood.setMoodContent(request.getParameter("moodContent"));
				mood.setMooduserName(request.getParameter("mooduserName"));
		
				//*************************************************************
				//	mood.setMoodAddfile(request.getParameter("moodAddfile"));
				moodServiceImpl.save(mood);
				List<Mood>  moodList =  moodServiceImpl.findAll("Mood");
				request.getSession().setAttribute("moodList", moodList);
				response.sendRedirect("manager/moodview.jsp");
			}
			
			
			
			
	     }
		
		
		if("list".equals(request.getParameter("mood"))){
			List<Mood>  moodList =  moodServiceImpl.findAll("Mood");
			request.getSession().setAttribute("moodList", moodList);
			response.sendRedirect("manager/moodview.jsp");
	     }
		//删除心情（管理员不可以）
		if("delete".equals(request.getParameter("mood"))){
			Mood mood=moodServiceImpl.findById(Integer.parseInt(request.getParameter("moodId")));
			moodServiceImpl.delete(mood);
			List<Mood>  moodList =  moodServiceImpl.findAll("Mood");
			request.getSession().setAttribute("moodList", moodList);
			response.sendRedirect("manager/moodview.jsp");
	     }
		

		//修改心情
		if("update".equals(request.getParameter("mood"))){
			
			
			Mood mood=moodServiceImpl.findById(Integer.parseInt(request.getParameter("moodId")));
			if("flag".equals(request.getParameter("flag"))){
				request.getSession().setAttribute("mood", mood);
				response.sendRedirect("manager/moodadd.jsp");
			}else{
				mood.setMoodTitle(request.getParameter("moodTitle"));
				mood.setMoodContent(request.getParameter("moodContent"));
				mood.setMooduserName(request.getParameter("mooduserName"));
				
				
				
				
				//************************************
//				mood.setMoodAddfile(request.getParameter("moodAddfile"));
				moodServiceImpl.update(mood);
				
				List<Mood>  moodList =  moodServiceImpl.findAll("Mood");
				request.getSession().setAttribute("moodList", moodList);
				response.sendRedirect("manager/moodview.jsp");
			}
			
			
			
			
	     }
		
		
		
		
		
		
		
		
	}

	
	
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
