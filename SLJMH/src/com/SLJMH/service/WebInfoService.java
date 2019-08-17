package com.SLJMH.service;

import com.SLJMH.entity.WebInfo;

public interface  WebInfoService extends  BaseService<WebInfo> {

	WebInfo findById(int parseInt);


}
