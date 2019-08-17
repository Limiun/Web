package com.SLJMH.service.impl;

import com.SLJMH.dao.FileDao;
import com.SLJMH.dao.impl.FileDaoImpl;
import com.SLJMH.entity.Files;
import com.SLJMH.service.FileService;

public class FileServiceImpl extends BaseServiceImpl<Files> implements FileService {
	
	private FileDao fileDaoImpl = null;
	public void setFileDaoImpl(FileDaoImpl fileDaoImpl) {
		  super.setBaseDaoImpl(fileDaoImpl);   
		  this.fileDaoImpl = fileDaoImpl;
	}
	@Override
	public Files findById(Integer integer) {
		// TODO Auto-generated method stub
		return fileDaoImpl.deleteById(integer);
	}
	@Override
	public void deleteFile(String fileUrl, String fileUuuName) {
		// TODO Auto-generated method stub
		fileDaoImpl.deleteFile(fileUrl,fileUuuName);
	}





}
