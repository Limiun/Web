package com.SLJMH.utils;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.SLJMH.entity.Role;
import com.mchange.v2.c3p0.ComboPooledDataSource;


@WebServlet("/PreFormServlet")
public class PreFormServlet extends HttpServlet {
    private static final long serialVersionUID = -884689940866074733L;
    private ApplicationContext applicationContext;
	private ComboPooledDataSource dataSource;
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String token = TokenProccessor.getInstance().makeToken();//创建令牌
        System.out.println("在FormServlet中生成的token："+token);
        request.getSession().setAttribute("token", token);  //在服务器使用session保存token(令牌)
        request.getRequestDispatcher("/manager/login.jsp").forward(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	System.out.println("↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓");
    	applicationContext = WebApplicationContextUtils.getWebApplicationContext(getServletContext());
    	dataSource = (ComboPooledDataSource) applicationContext.getBean("dataSource");
    	QueryRunner runner = new QueryRunner(dataSource);
    	
	     String sql00 = "select * from role where roleId=1 or roleId=2 ";
		try {
			 if(runner.query(sql00,new BeanListHandler<Role>(Role.class)).size() !=0){
				System.out.println("系统值已经存在");
			}else{
				     String sql = "insert into role values(?,?)";
					try {
						runner.update(sql,1, "超级管理员");
						runner.update(sql,2, "游客");
						System.out.println("系统值已经插入");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
	   
   

	System.out.println("↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑");
    }

}