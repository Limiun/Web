package com.SLJMH.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebListener;
@WebListener("MyListener")
public class MyListener implements ServletContextListener {
	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		   System.out.println("★★★ ServletContext初始化监听器开始 ★★★");
		   String value=arg0.getServletContext().getInitParameter("Spring");
	       System.out.println("★★★"+value+"★★★");
	       
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		   System.out.println("★★★ ServletContext销毁监听器开始 ★★★");
	}
}
