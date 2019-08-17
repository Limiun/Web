package com.SLJMH.dao.impl;

import com.SLJMH.dao.CommentDao;

import com.SLJMH.entity.Comment;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * 评论Dao
 */
public class CommentDaoImpl extends HibernateDaoSupport implements CommentDao {

    private final String HQL_SELECT = "from " + Comment.class.getCanonicalName();

	@Override
	public List<Comment> findByCommentUserId(Integer userId) {
		return getHibernateTemplate().find(HQL_SELECT + " where c_oterid=?",userId);
	}

	@Override
	public Comment getid(Integer id) {
		 return getHibernateTemplate().get(Comment.class,id);
	}

	@Override
	public void save(Comment comment) {
		getHibernateTemplate().save(comment);
		
	}

	@Override
	public List<Comment> findAll() {
		return getHibernateTemplate().find(HQL_SELECT);
	}

	@Override
	public List<Comment> findByContentId(Integer contentId) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().find(HQL_SELECT + " where c_contentid=?",contentId);
	}







	
}
