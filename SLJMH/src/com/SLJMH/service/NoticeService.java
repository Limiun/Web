package com.SLJMH.service;

import com.SLJMH.entity.Notice;

public interface  NoticeService extends  BaseService<Notice> {

	Notice findById(int parseInt);


}
