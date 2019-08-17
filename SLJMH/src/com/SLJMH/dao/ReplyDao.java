package com.SLJMH.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.SLJMH.entity.Comment;
import com.SLJMH.entity.Complaint;
import com.SLJMH.entity.Reply;
@Repository
public interface ReplyDao{
	/**
	 * 获取回复列表
	 * @param userId
	 * @return
	 */
	List<Reply> findByCommentUserId(Integer userId);
	List<Reply> findByR_contentid(Integer r_contentid);
	/**
	 * 获取评论id
	 * @param id
	 * @return
	 */
	
	void save(Reply reply);
	List<Reply> findAll();
	
}
