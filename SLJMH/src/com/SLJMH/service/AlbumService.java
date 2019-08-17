package com.SLJMH.service;

import com.SLJMH.entity.Album;

public interface AlbumService extends  BaseService<Album>{

	Album findById(Integer integer);

	Album deleteById(Integer id);

	
	

}
