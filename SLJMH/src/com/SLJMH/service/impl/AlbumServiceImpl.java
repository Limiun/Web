package com.SLJMH.service.impl;

import com.SLJMH.dao.AlbumDao;
import com.SLJMH.dao.impl.AlbumDaoImpl;
import com.SLJMH.entity.Album;
import com.SLJMH.service.AlbumService;

public class AlbumServiceImpl  extends BaseServiceImpl<Album> implements AlbumService{
	
	
	
	private AlbumDao albumDaoImpl = null;
	
	public void setAlbumDaoImpl(AlbumDaoImpl albumDaoImpl) {
		  super.setBaseDaoImpl(albumDaoImpl);   
		  this.albumDaoImpl = albumDaoImpl;
	}
	
	@Override
	public Album findById(Integer integer) {
		// TODO Auto-generated method stub
		return albumDaoImpl.deleteById(integer);
	}
	
	@Override
	public Album deleteById(Integer id) {
		return albumDaoImpl.deleteById(id);
		
	}
	


}

