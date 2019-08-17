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
import com.SLJMH.entity.WebInfo;
import com.SLJMH.service.PicService;
import com.SLJMH.service.WebInfoService;

@WebServlet(value = "/WebSiteServlet")
public class WebSiteController extends HttpServlet {

	private WebInfoService   webInfoServiceImpl;
	private ApplicationContext applicationContext;
	private PicService   picServiceImpl;
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		webInfoServiceImpl = (WebInfoService) applicationContext.getBean("WebInfoServiceImpl");
		picServiceImpl = (PicService) applicationContext.getBean("PicServiceImpl");
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		
		
		 if("yor".equals(request.getParameter("yor"))){
			 List<WebInfo>  wiList =webInfoServiceImpl.findAll("WebInfo");
			 List<Pics>  pList =picServiceImpl.findAll("Pics");
			 if(wiList.size()>0 && pList.size()>0){
				 WebInfo wi=wiList.get(0);
				 request.getSession().setAttribute("wi",wi);
				 request.getSession().setAttribute("Pics", pList);
				 response.sendRedirect("yorbest/index.jsp");
			 }else{
				 response.sendRedirect("yorbest/index.html");
			 }
			
		 }
		
		if("add".equals(request.getParameter("website"))){
			WebInfo wi=new WebInfo();
			wi.setWebTitle(request.getParameter("webTitle"));
			wi.setWebSummary(request.getParameter("webSummary"));
			wi.setWebIntroduction(request.getParameter("webIntroduction"));
			wi.setBrandTitle(request.getParameter("brandTitle"));
			wi.setBrandSummary(request.getParameter("brandSummary"));
			wi.setBrandIntroduction(request.getParameter("brandIntroduction"));
			wi.setBrandBackPic(request.getParameter("brandBackPic"));
			wi.setBlogId(Integer.parseInt(request.getParameter("blogId")));
			wi.setAboutTitle(request.getParameter("aboutTitle"));
			wi.setAboutSummary(request.getParameter("aboutSummary"));
			wi.setAboutIntroduction(request.getParameter("aboutIntroduction"));
			wi.setAboutInfo(request.getParameter("aboutInfo"));
			wi.setAboutPic1(request.getParameter("aboutPic1"));
			wi.setAboutPic2(request.getParameter("aboutPic2"));
			wi.setAboutPic3(request.getParameter("aboutPic3"));
			webInfoServiceImpl.save(wi);
			request.getSession().setAttribute("wi",wi);
			response.sendRedirect("manager/webindex.jsp");
			
		}
		
		
		if("update".equals(request.getParameter("website"))){
			
			List<WebInfo>  wiList =	webInfoServiceImpl.findAll("WebInfo");
			if(wiList.size()>0){
				WebInfo wi=wiList.get(0);
			  if("sure".equals(request.getParameter("sure"))){
				  wi.setWebTitle(request.getParameter("webTitle"));
					wi.setWebSummary(request.getParameter("webSummary"));
					wi.setWebIntroduction(request.getParameter("webIntroduction"));
					wi.setBrandTitle(request.getParameter("brandTitle"));
					wi.setBrandSummary(request.getParameter("brandSummary"));
					wi.setBrandIntroduction(request.getParameter("brandIntroduction"));
					wi.setBrandBackPic(request.getParameter("brandBackPic"));
					wi.setBlogId(Integer.parseInt(request.getParameter("blogId")));
					wi.setAboutTitle(request.getParameter("aboutTitle"));
					wi.setAboutSummary(request.getParameter("aboutSummary"));
					wi.setAboutIntroduction(request.getParameter("aboutIntroduction"));
					wi.setAboutInfo(request.getParameter("aboutInfo"));
					wi.setAboutPic1(request.getParameter("aboutPic1"));
					wi.setAboutPic2(request.getParameter("aboutPic2"));
					wi.setAboutPic3(request.getParameter("aboutPic3"));
					webInfoServiceImpl.update(wi);
					
			  }
			    request.getSession().setAttribute("wi",wi);
			}
			   response.sendRedirect("manager/webindex.jsp");
		}
		
			  
		
		
		

	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}

