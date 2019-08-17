package com.SLJMH.service.impl;

import java.util.List;

import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;

import com.SLJMH.dao.BaseDao;
import com.SLJMH.dao.impl.BaseDaoImpl;
import com.SLJMH.service.BaseService;


public class BaseServiceImpl<T> implements BaseService<T> {
    

	private BaseDao<T> baseDaoImpl=null;
	public void setBaseDaoImpl(BaseDaoImpl<T> baseDaoImpl) {
		this.baseDaoImpl = baseDaoImpl;
	}

	@Override
	public void save( T entity) {
		// TODO Auto-generated method stub
	    baseDaoImpl.save(entity);
	}

	@Override
	public void delete(T entity) {
		// TODO Auto-generated method stub
		baseDaoImpl.delete(entity);
	}

	@Override
	public void update(T entity) {
		// TODO Auto-generated method stub
		baseDaoImpl.update(entity);
	}


	public List<T> findAll(String  clazz) {
		// TODO Auto-generated method stub
		return baseDaoImpl.findAll(clazz);
	}

	@Override
	public List<T> findByName(String name) {
		// TODO Auto-generated method stub
		return baseDaoImpl.findByName(name);
	}


}
