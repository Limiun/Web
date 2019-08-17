package com.SLJMH.service.impl;


import java.util.List;

import com.SLJMH.dao.IcoDao;
import com.SLJMH.dao.impl.IcoDaoImpl;
import com.SLJMH.entity.Ico;
import com.SLJMH.service.IcoService;


public class IcoServiceImpl extends BaseServiceImpl<Ico> implements IcoService {
	
	private IcoDao icoDaoImpl = null;
	public void setIcoDaoImpl(IcoDaoImpl icoDaoImpl) {
		 super.setBaseDaoImpl(icoDaoImpl);   
		 this.icoDaoImpl = icoDaoImpl;
	}







}
