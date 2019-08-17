package com.SLJMH.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.SLJMH.dao.ReplyDao;
import com.SLJMH.entity.Reply;
import com.SLJMH.service.ReplyService;
@Service
public class ReplyServiceImpl implements ReplyService{

	
	@Autowired
	private ReplyDao replyDao;
	@Override
	public void save(Reply reply) {
		
		
	}

	@Override
	public List<Reply> findByR_contentid(Integer r_contentid) {
		// TODO Auto-generated method stub
		return replyDao.findByR_contentid(r_contentid);
	}

}
