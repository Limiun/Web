package com.SLJMH.dao.impl;



import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.SLJMH.dao.RoleDao;
import com.SLJMH.entity.Role;


public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao{
	
	
	@Override
	public int findByUserId(Integer userId) {
		// TODO Auto-generated method stub
		 Session session = getHibernateTemplate().getSessionFactory().getCurrentSession() ;
		 Query query = session.createSQLQuery("select  roleId  from  role_users  where  userid="+userId);
		 List<Integer> qlist=query.list();
		 if(qlist.size()>0){
			 return  qlist.get(0);
		 }else{
			 return  0;
		 }
		 
		
	}

	//给注册用户默认权限为2-未审核
	@Override
	public void saveUserId(Integer userId) {
		// TODO Auto-generated method stub
		 Session session = getHibernateTemplate().getSessionFactory().getCurrentSession() ;
		 Query query = session.createSQLQuery("insert into role_users VALUES (2,"+userId+","+userId+")");
		 query.executeUpdate();
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		getHibernateTemplate().delete(findById(id));
		//删除角色下用户
		 //1-  找到该角色下所有用户ID
		 Session session = getHibernateTemplate().getSessionFactory().getCurrentSession() ;
		 Query query = session.createSQLQuery("select userid  from  role_users where roleid="+id);
		 List<Integer> ulist=query.list();
		 //2 -删除用户
		 for(int i = 0 ; i < ulist.size() ; i++) {
			  Query q=session.createSQLQuery("delete  from  user  where userid="+ulist.get(i));
			  q.executeUpdate();
			}
		 
	}

	@Override
	public Role findById(int id) {
		// TODO Auto-generated method stub
		List<Role> roleList=getHibernateTemplate().find("from com.SLJMH.entity.Role where roleId="+id);
		return  roleList.get(0);
	}
	



	
}
