package com.SLJMH.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.SLJMH.entity.Comment;
import com.SLJMH.entity.Complaint;
@Repository
public interface CommentDao{
	/**
	 * 获取被评论列表
	 * @param userId
	 * @return
	 */
	List<Comment> findByCommentUserId(Integer userId);
	List<Comment> findByContentId(Integer contentId);
	/**
	 * 获取评论id
	 * @param id
	 * @return
	 */
	Comment getid(Integer id);
	void save(Comment comment);
	List<Comment> findAll();
	
}
