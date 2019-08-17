package com.SLJMH.service.impl;

import com.SLJMH.dao.PicDao;
import com.SLJMH.dao.impl.PicDaoImpl;
import com.SLJMH.entity.Pics;
import com.SLJMH.service.PicService;

public class PicServiceImpl extends BaseServiceImpl<Pics> implements PicService {
	
	private PicDao picDaoImpl = null;
	public void setPicDaoImpl(PicDaoImpl picDaoImpl) {
		  super.setBaseDaoImpl(picDaoImpl);   
		  this.picDaoImpl = picDaoImpl;
	}
	@Override
	public Pics findById(Integer integer) {
		// TODO Auto-generated method stub
		return picDaoImpl.deleteById(integer);
	}





}
