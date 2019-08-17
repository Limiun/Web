package com.SLJMH.dao.impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.SLJMH.dao.ReplyDao;
import com.SLJMH.entity.Comment;
import com.SLJMH.entity.Reply;

public class ReplyDaoImpl extends HibernateDaoSupport implements ReplyDao{
	private final String HQL_SELECT = "from " + Reply.class.getCanonicalName();
	
	@Override
	public List<Reply> findByCommentUserId(Integer userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Reply> findByR_contentid(Integer r_contentid) {
		// TODO Auto-generated method stub
		return getHibernateTemplate().find(HQL_SELECT + " where r_contentid=?",r_contentid);
	}

	@Override
	public void save(Reply reply) {
		getHibernateTemplate().save(reply);
		
	}

	@Override
	public List<Reply> findAll() {
		return getHibernateTemplate().find(HQL_SELECT);
	}

}
