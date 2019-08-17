package com.SLJMH.service.impl;

import com.SLJMH.dao.WebInfoDao;
import com.SLJMH.dao.impl.WebInfoDaoImpl;
import com.SLJMH.entity.WebInfo;
import com.SLJMH.service.WebInfoService;

public class WebInfoServiceImpl extends BaseServiceImpl<WebInfo> implements WebInfoService {
	
	private WebInfoDao webInfoDaoImpl = null;
	public void setWebInfoDaoImpl(WebInfoDaoImpl webInfoDaoImpl) {
		 super.setBaseDaoImpl(webInfoDaoImpl);   
		 this.webInfoDaoImpl = webInfoDaoImpl;
	}
	@Override
	public WebInfo findById(int id) {
		// TODO Auto-generated method stub
		return webInfoDaoImpl.findById(id);
	}







}
