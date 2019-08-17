package com.SLJMH.service;

import java.util.List;

import com.SLJMH.entity.Reply;

public interface ReplyService {
	
	void save(Reply reply);

	List<Reply> findByR_contentid(Integer r_contentid);

}
