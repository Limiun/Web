package com.SLJMH.service;

import java.util.List;

import com.SLJMH.entity.UserNotice;




public interface  UserNoticeService extends  BaseService<UserNotice> {

	java.util.List<UserNotice> findAllByUserId(int parseInt);

	UserNotice findById(int parseInt);

	List<UserNotice> findNoReadById(Integer userId);



}
