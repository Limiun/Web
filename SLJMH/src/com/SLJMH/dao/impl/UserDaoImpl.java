package com.SLJMH.dao.impl;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.SLJMH.dao.UserDao;
import com.SLJMH.entity.User;
import com.SLJMH.utils.InitAdminPage;


public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao{
	
	//通过邮箱查找用户
	@Override
	public User findEmail(String email) {
		// TODO Auto-generated method stub
	      
		List<User> userlist=
		getHibernateTemplate().find("from com.SLJMH.entity.User where userEmail='"+email+"'");
		if(userlist.size()>=1){
			return userlist.get(0);
		}else{
			return new User();
		}
		
	}

	//审核用户登录状态
	public User LoginCheck(String email, String pass) {
		// TODO Auto-generated method stub
		List<User> userlist=
		getHibernateTemplate().find("from com.SLJMH.entity.User where userEmail='"+email+"'" +"and userPassWord='" +pass+"'" );
	    if(userlist.size()>=1){
	    	return userlist.get(0);
	    }else{
	    	return new User();
	    }
	}


	@Override
	public InitAdminPage initAdminPage(User user) {
		// TODO Auto-generated method stub
		InitAdminPage initAdminPage=new InitAdminPage();
		return initAdminPage;
	}

	//通过userid查找用户
	@Override
	public User findById(int id) {
		// TODO Auto-generated method stub
		List<User> userList=getHibernateTemplate().find("from com.SLJMH.entity.User where userId="+id);
		return  userList.get(0);
	}

	//修改权限
	@Override
	public void updateRoleId(int roleId, Integer userId) {
		// TODO Auto-generated method stub
		 Session session = getHibernateTemplate().getSessionFactory().getCurrentSession() ;
		 Query query = session.createSQLQuery("update  role_users set roleId ="+roleId+" where userid="+userId);
		 query.executeUpdate();
	}

	//删除权限
	@Override
	public void deleteRoleId(Integer userId) {
		// TODO Auto-generated method stub
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession() ;
		 Query query = session.createSQLQuery("delete  from  role_users  where userid="+userId);
		 query.executeUpdate();
	}

	//通过username查找user
    @Override
    public User findByUserName(String userName) {
	    List<User> users = getHibernateTemplate().find("from " + User.class.getCanonicalName()+ " where userName = ? ",userName);
	    if(users.size() != 0){
            return users.get(0);
        }
        else{
	        return null;
        }
    }


}
