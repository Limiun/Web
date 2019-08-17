package com.SLJMH.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.SLJMH.entity.User;
import com.SLJMH.service.RoleService;
import com.SLJMH.service.UserService;

@WebServlet(value = "/RegisterServlet", initParams = { @WebInitParam(name = "ServletSite", value = "http://com.SLJMH") })
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApplicationContext applicationContext;
	private User user;
	private UserService userServiceImpl;
	private RoleService roleServiceImpl;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		System.out.println("★★★ Servlet的 init方法,执行一次 ★★★");
		System.out.println("★★★ 读取Servlet的配置参数："+ getServletConfig().getInitParameter("ServletSite") + "★★");
        //Spring不能对Filter和Servlet自动注入属性；
		// 没有使用监听器的做法，每次都要加载配置文件，但是每次都会装配Bean，避免这个方法就使用监听器，但是就用不要close方法。
        // ClassPathXmlApplicationContext applicationContext =new ClassPathXmlApplicationContext("applicationContext.xml");
	    //WebApplicationContext applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
		applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
        user=(User) applicationContext.getBean("User");
        //这里因为在MyBeanPostProcessor对此Bean进行了增强，返回的是代理对象(JDK方式)，这个对象只能使用接口接收，如果不增强，就可以直接使用实现类接收
		userServiceImpl = (UserService) applicationContext.getBean("UserServiceImpl");
		roleServiceImpl = (RoleService) applicationContext.getBean("RoleServiceImpl");
		
	}

	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		
		 //进行注册校验
		 if("ajax".equals(request.getParameter("flag"))){
	     if(userServiceImpl.findEmail(request.getParameter("Email")).getUserEmail() != null){
	    	 response.setContentType("text/html;charset=UTF-8");
		     response.getWriter().write("Email already exists！");
	     }
		
		}else{
			
			 try { Thread.sleep(1*1000);} catch (InterruptedException e) { e.printStackTrace();}
			//处理重复提交  
			 boolean b = isRepeatSubmit(request);
			 request.getSession().removeAttribute("token");
			 if(b==true){        	 
	        	 System.out.println("用户重复提交表单【regForm】,但是没用…… 哈哈，只接受第一次请求。");
	         }else{
	        	 try {
	 				 BeanUtils.populate(user, request.getParameterMap());
	 			    } catch (IllegalAccessException | InvocationTargetException e) {
	 				// TODO Auto-generated catch block
	 				e.printStackTrace();
	 			}
	     			userServiceImpl.save(user);
	     			//给新用户添加默认角色默认为未审核2
	     			roleServiceImpl.saveUserId(user.getUserId());
	     			
	         }
				response.sendRedirect("PreFormServlet");
				// applicationContext.close();
		}

	
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	  private boolean isRepeatSubmit(HttpServletRequest request) {
          String client_token = request.getParameter("token");
          //1、如果用户提交的表单数据中没有token，则用户是重复提交了表单
          if(client_token==null){
        	  System.out.println("1");
              return true;
          }
          //取出存储在Session中的token
          String server_token = (String) request.getSession().getAttribute("token");
          //2、如果当前用户的Session中不存在Token(令牌)，则用户是重复提交了表单
          if(server_token==null){
        	  System.out.println("2");
              return true;
          }
          //3、存储在Session中的Token(令牌)与表单提交的Token(令牌)不同，则用户是重复提交了表单
          if(!client_token.equals(server_token)){
        	  System.out.println("3");
              return true;
          }
          
          return false;
      }
	public void setUser(User user) {
		this.user = user;
	}

	public void setUserServiceImpl(UserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}


}

