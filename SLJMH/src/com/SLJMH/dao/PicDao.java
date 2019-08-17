package com.SLJMH.dao;

import com.SLJMH.entity.Pics;

public interface PicDao extends BaseDao<Pics> {

	Pics deleteById(Integer integer);

}
