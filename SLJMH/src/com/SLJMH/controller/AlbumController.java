package com.SLJMH.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.SLJMH.entity.Album;
import com.SLJMH.service.AlbumService;




@SuppressWarnings("serial")
@WebServlet(value = "/AlbumServlet")
public class AlbumController extends HttpServlet {

	private AlbumService   albumServiceImpl;
	private ApplicationContext applicationContext;
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		albumServiceImpl = (AlbumService) applicationContext.getBean("albumServiceImpl");
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		if("add".equals(request.getParameter("album"))){
			if("flag".equals(request.getParameter("flag"))){
				request.getSession().setAttribute("Album", "");
				   response.sendRedirect("manager/addalbum.jsp");
				}else{
			
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");     
				Album album=new Album();
				album.setAlbumName(request.getParameter("albumName"));
				album.setAlbumTag(request.getParameter("albumTag"));
				album.setAlbumuserName(request.getParameter("albumuserName"));
				album.setAlbumDatetime(sdf.format(new Date()));
				
				album.setAlbumPic(request.getParameter("albumPic"));
				album.setAlbumPermission(request.getParameter("albumPermission"));
				albumServiceImpl.save(album);
				List<Album>  albumList =  albumServiceImpl.findAll("Album");
				request.getSession().setAttribute("Album", albumList);
				response.sendRedirect("manager/listalbum.jsp");
			}
			

		}
		
			
			
			
			
	     
		
		if("list".equals(request.getParameter("album"))){
			List<Album>  albumList =albumServiceImpl.findAll("Album");
			request.getSession().setAttribute("Album", albumList);
			response.sendRedirect("manager/listalbum.jsp");
		}
		if("update".equals(request.getParameter("album"))){
			
			Album album=albumServiceImpl.findById(Integer.parseInt(request.getParameter("albumID")));
			if("flag".equals(request.getParameter("flag"))){
				
				request.getSession().setAttribute("Album", album);
				response.sendRedirect("manager/updatealbum.jsp");
			}else{
			album.setAlbumName(request.getParameter("albumName"));
			album.setAlbumTag(request.getParameter("albumTag"));
			album.setAlbumuserName(request.getParameter("albumuserName"));
			album.setAlbumPic(request.getParameter("albumPic"));
			album.setAlbumPermission(request.getParameter("albumPermission"));
			albumServiceImpl.update(album);
			List<Album>  albumList =albumServiceImpl.findAll("Album");
			request.getSession().setAttribute("Album", albumList);
			response.sendRedirect("manager/listalbum.jsp");
			}
		}
		
		
		if("delete".equals(request.getParameter("album"))){
			
			Album album=albumServiceImpl.findById(Integer.parseInt(request.getParameter("albumID")));
			albumServiceImpl.delete(album);
			List<Album>  albumList =albumServiceImpl.findAll("Album");
			request.getSession().setAttribute("Album",albumList);
			response.sendRedirect("manager/listalbum.jsp");
		}
		
		

	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
