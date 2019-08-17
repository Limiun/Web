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

import com.SLJMH.entity.Notice;
import com.SLJMH.entity.User;
import com.SLJMH.entity.UserNotice;
import com.SLJMH.service.NoticeService;
import com.SLJMH.service.UserNoticeService;
import com.SLJMH.service.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet(value = "/NoticeServlet")
public class NoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicationContext applicationContext;
	private UserService userServiceImpl;
	private NoticeService noticeServiceImpl;
	private UserNoticeService userNoticeServiceImpl;
	private final Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		userServiceImpl = (UserService) applicationContext.getBean("UserServiceImpl");
		noticeServiceImpl = (NoticeService) applicationContext.getBean("NoticeServiceImpl");
		userNoticeServiceImpl = (UserNoticeService) applicationContext.getBean("UserNoticeServiceImpl");
	}

	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
        
		
		
		if("users".equals(request.getParameter("notice"))){
			
			 List<User>  userList =  userServiceImpl.findAll("User");
			 request.getSession().setAttribute("userList", userList);
		     response.sendRedirect("manager/notice.jsp");
	      }
		if("add".equals(request.getParameter("notice"))){
			
			String[] checkbox=request.getParameterValues("userId");
			Integer[] userIds = new Integer[checkbox.length];
			for(int i=0; i<checkbox.length;i++){  
				userIds[i] = Integer.parseInt(checkbox[i]);
			}
			
			List<Integer> userId=java.util.Arrays.asList(userIds);
			String noticeTitle=request.getParameter("noticeTitle");
			String noticeDate=request.getParameter("noticeDate");
			String noticeContent=request.getParameter("noticeContent");
			
			UserNotice userNotice= new UserNotice();
			for(int i=0; i<userIds.length;i++){  
				userNotice.setUserId(userIds[i]);
				userNotice.setNoticeTitle(noticeTitle);
				userNotice.setNoticeContent(noticeContent);
				userNotice.setNoticeState("0");
				userNotice.setNoticeDate(noticeDate);
				userNoticeServiceImpl.save(userNotice);
			}
			
			Notice notice= new Notice();
			notice.setNoticeTitle(noticeTitle);
			notice.setNoticeDate(noticeDate);
			notice.setNoticeContent(noticeContent);
			notice.setUserId(userId);
			noticeServiceImpl.save(notice);
		
			response.sendRedirect("manager/notice.jsp");
	     }
		
		
		if("list".equals(request.getParameter("notice"))){
			 int roleid= (int) request.getSession().getAttribute("roleid");
			 if(roleid==1){
				 List<Notice>  List =noticeServiceImpl.findAll("Notice");
				 request.getSession().setAttribute("List", List);
				 response.sendRedirect("manager/noticeview.jsp");
			 }else{
				 int userid= (int)request.getSession().getAttribute("userid");
				 List<UserNotice>  List =userNoticeServiceImpl.findAllByUserId(userid);
				 request.getSession().setAttribute("List", List);
				 response.sendRedirect("manager/noticeuserview.jsp");
			 }
			   
	     }
		if("delete".equals(request.getParameter("notice"))){
			Notice notice=noticeServiceImpl.findById(Integer.parseInt(request.getParameter("noticeId")));
			noticeServiceImpl.delete(notice);
			List<Notice>  List =noticeServiceImpl.findAll("Notice");
			request.getSession().setAttribute("List", List);
			response.sendRedirect("manager/noticeview.jsp");
	     }
		
		if("userdelete".equals(request.getParameter("notice"))){
			UserNotice userNotice=userNoticeServiceImpl.findById(Integer.parseInt(request.getParameter("id")));
			userNoticeServiceImpl.delete(userNotice);
			 int userid= (int)request.getSession().getAttribute("userid");
			 List<UserNotice>  List =userNoticeServiceImpl.findAllByUserId(userid);
			 request.getSession().setAttribute("List", List);
			 response.sendRedirect("manager/noticeuserview.jsp");
	     }
		

		if("update".equals(request.getParameter("notice"))){
			UserNotice userNotice=userNoticeServiceImpl.findById(Integer.parseInt(request.getParameter("id")));
			userNotice.setNoticeState("1");
			userNoticeServiceImpl.update(userNotice);
			int userid= (int)request.getSession().getAttribute("userid");
			 List<UserNotice>  noList =userNoticeServiceImpl.findNoReadById(userid);
			 request.getSession().setAttribute("noList", noList);
			List<UserNotice>  List =userNoticeServiceImpl.findAllByUserId(userid);
			request.getSession().setAttribute("List", List);
			response.sendRedirect("manager/noticeuserview.jsp");
	     }
		
		
		
		
		
		
		
		
	}

	
	
	
	
	
	
	
	
	
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	  


}

