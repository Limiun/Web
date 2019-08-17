package com.SLJMH.dao;

import java.util.List;
import com.SLJMH.entity.UserNotice;



public interface UserNoticeDao extends BaseDao<UserNotice> {

	List<UserNotice> findAllByUserId(int id);

	UserNotice findById(int id);

	List<UserNotice> findNoReadById(Integer userId);

}
