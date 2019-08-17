package com.SLJMH.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.SLJMH.dao.BaseDao;
import com.SLJMH.utils.GenericsUtils;

/**
 * 使用继承 HibernateDaoSupport的方式的话，不需要在手动写 HibernateTemplate属性
 * @author Administrator
 *
 * @param <T>
 */
public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T>  {
	
	@SuppressWarnings("unchecked")
	private Class<T> clazz =GenericsUtils.getSuperClassGenricType(BaseDaoImpl.class, 0);
	public void save(T entity) {
		getHibernateTemplate().save(entity);  
	}


	@Override
	public void delete(T entity) {
		// TODO Auto-generated method stub
		getHibernateTemplate().delete(entity);  
	}

	@Override
	public void update(T entity) {
		// TODO Auto-generated method stub
		getHibernateTemplate().merge(entity);  
	}


	@Override
	public List<T> getByIds(Integer[] ids) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<T> findAll(String  clazz) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().find("from com.SLJMH.entity."+clazz);
	}

	@Override
	public List<T> findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}





	




}
