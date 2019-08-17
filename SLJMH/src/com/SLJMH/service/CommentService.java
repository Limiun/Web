package com.SLJMH.service;

import com.SLJMH.dao.CommentDao;
import com.SLJMH.entity.Comment;
import com.SLJMH.entity.Complaint;

import java.util.List;

/**
 * 评论接口
 */
public interface CommentService {

	/**
	 * 获取被评论列表
	 * @param userId
	 * @return
	 */
	List<Comment> findByCommentUserId(Integer userId);

    /**
     * 创建评论
     * @param comment
     */
    void createComment(Comment comment);

 

    /**
     * 获取全部评论
     * @return
     */
    List<Comment> findAll();

  

	List<Comment> findByContentId(int contentId);


   
}
