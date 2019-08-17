package com.SLJMH.dao;

import com.SLJMH.entity.Notice;

public interface NoticeDao extends BaseDao<Notice> {

	Notice findById(int id);



}
