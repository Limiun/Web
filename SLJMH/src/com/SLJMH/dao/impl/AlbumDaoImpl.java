package com.SLJMH.dao.impl;

import java.util.List;


import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.SLJMH.dao.AlbumDao;
import com.SLJMH.entity.Album;




public class AlbumDaoImpl  extends BaseDaoImpl<Album> implements AlbumDao {

	public Album findById(int id) {
		// TODO Auto-generated method stub
		List<Album> albumList=getHibernateTemplate().find("from com.SLJMH.entity.Album where albumID="+id);
		 if(albumList.size()>0){
			 return  albumList.get(0);
		 }else{
			 return  new Album();
		 }
	}

	public Album deleteById(Integer id) {
		// TODO Auto-generated method stub
		 List<Album> albumList=getHibernateTemplate().find("from com.SLJMH.entity.Album where albumID="+id);
		 if(albumList.size()>0){
			 return    albumList.get(0);
		 }else{
			 return new Album();
		 }
		
	}


}
