package com.SLJMH.dao;

import com.SLJMH.entity.WebInfo;

public interface WebInfoDao extends BaseDao<WebInfo> {

	WebInfo findById(int id);



}
