package com.SLJMH.service.impl;


import com.SLJMH.dao.CommentDao;

import com.SLJMH.entity.Comment;

import com.SLJMH.service.CommentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;



/**
 * 评论服务类
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

  


    @Override
    public List<Comment> findAll() {
        return commentDao.findAll();
    }

   
	@Override
	public List<Comment> findByCommentUserId(Integer userId) {
		 return commentDao.findByCommentUserId(userId);
	}

	@Override
	public void createComment(Comment comment) {
//		User currUser = userDao.findById(comment.getC_userid().intValue());
//		comment.setC_username(currUser.getUserName());
//		
//        User otherUser = userDao.findById(comment.getC_otherid().intValue());
//        Blog blog=blogDao.findById(comment.get);
//       
//		comment.setC_contentid();
//		comment.setC_createtime(new Date());
//		comment.setC_otherid(otherUser.getUserId().intValue());
//		comment.setC_othername(otherUser.getUserName());
//		comment.setC_userid(currUser.getUserId().intValue());
//        comment.setC_username(c_username);
     

     

        

        commentDao.save(comment);
		
	}


	@Override
	public List<Comment> findByContentId(int contentId) {
		// TODO Auto-generated method stub
		return commentDao.findByContentId(contentId);
	}
}
