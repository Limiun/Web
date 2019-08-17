package com.SLJMH.service;

import com.SLJMH.entity.Pics;

public interface  PicService extends  BaseService<Pics> {

	Pics findById(Integer integer);

}
