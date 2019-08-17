package com.SLJMH.service.impl;

import com.SLJMH.dao.NoticeDao;
import com.SLJMH.dao.impl.NoticeDaoImpl;
import com.SLJMH.entity.Notice;
import com.SLJMH.service.NoticeService;

public class NoticeServiceImpl extends BaseServiceImpl<Notice> implements NoticeService {
	
	private NoticeDao noticeDaoImpl = null;
	public void setNoticeDaoImpl(NoticeDaoImpl noticeDaoImpl) {
		 super.setBaseDaoImpl(noticeDaoImpl);   
		 this.noticeDaoImpl = noticeDaoImpl;
	}
	@Override
	public Notice findById(int id) {
		// TODO Auto-generated method stub
		return noticeDaoImpl.findById(id);
	}







}
