package com.SLJMH.dao.impl;

import com.SLJMH.dao.ComplaintDao;
import com.SLJMH.entity.Complaint;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

/**
 * 投诉DAO 实现
 */
public class ComplaintDaoImpl extends HibernateDaoSupport implements ComplaintDao {

    private final String HQL_SELECT = "from " + Complaint.class.getCanonicalName();

    @Override
    public List<Complaint> findByComplaintedUserId(long userId) {
        return getHibernateTemplate().find(HQL_SELECT + " where complaintedUserId=? or userId=?",userId,userId);
    }

    @Override
    public void save(Complaint complaint) {
        getHibernateTemplate().save(complaint);
    }

    @Override
    public Complaint get(long id) {
        return getHibernateTemplate().get(Complaint.class,id);
    }

    @Override
    public void update(Complaint complaint) {
        getHibernateTemplate().update(complaint);
    }

    @Override
    public List<Complaint> findAll() {
        return getHibernateTemplate().find(HQL_SELECT);
    }
}
