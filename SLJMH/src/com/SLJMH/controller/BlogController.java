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

import com.SLJMH.entity.Blog;
import com.SLJMH.service.BlogService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(value = "/BlogServlet")
public class BlogController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicationContext applicationContext;
	private BlogService blogServiceImpl;
	private final Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		blogServiceImpl = (BlogService) applicationContext.getBean("BlogServiceImpl");
	}

	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		
		
		  if("all".equals(request.getParameter("blog"))){
			 List<Blog>  blogList =  blogServiceImpl.findAll("Blog");
			 if(blogList.size()>0){
				 request.getSession().setAttribute("blogList", blogList);
				 response.sendRedirect("yorbest/blog.jsp");
			 }else{
				 response.sendRedirect("yorbest/index.html");
			 }
			
	 	  }
		  
		  
		  if("detail".equals(request.getParameter("blog"))){
			  
			Blog  blog =  blogServiceImpl.findById(Integer.parseInt(request.getParameter("blogId")));
			request.getSession().setAttribute("blog", blog);
			response.sendRedirect("yorbest/blog-details.jsp");
		 	 }
		
		
		if("add".equals(request.getParameter("blog"))){
			
			if("flag".equals(request.getParameter("flag"))){
			   request.getSession().setAttribute("blog","");
			   response.sendRedirect("manager/blogadd.jsp");
			}else{
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");     
				Blog blog=new Blog();
				blog.setBlogTitle(request.getParameter("blogTitle"));
				blog.setBlogTag(request.getParameter("blogTag"));
				blog.setBlogSummary(request.getParameter("blogSummary"));
				blog.setBlogDate(sdf.format(new Date()));
				blog.setBlogContent(request.getParameter("blogContent"));
				blog.setBlogBackPic(request.getParameter("blogBackPic"));
				blog.setBloguserName(request.getParameter("bloguserName"));
				blog.setBloguserId(Integer.parseInt("bloguserId"));
				blogServiceImpl.save(blog);
				List<Blog>  blogList =  blogServiceImpl.findAll("Blog");
				request.getSession().setAttribute("blogList", blogList);
				response.sendRedirect("manager/blogview.jsp");
			}
			
			
			
			
	     }
		
		
		if("list".equals(request.getParameter("blog"))){
			List<Blog>  blogList =  blogServiceImpl.findAll("Blog");
			request.getSession().setAttribute("blogList", blogList);
			response.sendRedirect("manager/blogview.jsp");
	     }
		if("delete".equals(request.getParameter("blog"))){
			Blog blog=blogServiceImpl.findById(Integer.parseInt(request.getParameter("blogId")));
			blogServiceImpl.delete(blog);
			List<Blog>  blogList =  blogServiceImpl.findAll("Blog");
			request.getSession().setAttribute("blogList", blogList);
			response.sendRedirect("manager/blogview.jsp");
	     }
		

		if("update".equals(request.getParameter("blog"))){
			
			
			Blog blog=blogServiceImpl.findById(Integer.parseInt(request.getParameter("blogId")));
			if("flag".equals(request.getParameter("flag"))){
				request.getSession().setAttribute("blog", blog);
				response.sendRedirect("manager/blogadd.jsp");
			}else{
				blog.setBlogTitle(request.getParameter("blogTitle"));
				blog.setBlogTag(request.getParameter("blogTag"));
				blog.setBlogSummary(request.getParameter("blogSummary"));
				blog.setBlogContent(request.getParameter("blogContent"));
				blog.setBlogBackPic(request.getParameter("blogBackPic"));
				blog.setBloguserName(request.getParameter("bloguserName"));
				blogServiceImpl.update(blog);
				
				List<Blog>  blogList =  blogServiceImpl.findAll("Blog");
				request.getSession().setAttribute("blogList", blogList);
				response.sendRedirect("manager/blogview.jsp");
			}
			
			
			
			
	     }
		
		
		
		
		
		
		
		
	}

	
	
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	  


}

