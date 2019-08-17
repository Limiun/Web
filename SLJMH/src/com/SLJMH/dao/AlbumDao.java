package com.SLJMH.dao;

import com.SLJMH.entity.Album;

public interface AlbumDao extends BaseDao<Album>{

	Album findById(int id);

	Album deleteById(Integer id);

}
