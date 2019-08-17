
package com.SLJMH.dao.impl;

import com.SLJMH.dao.ComplaintProcessLogDao;
import com.SLJMH.entity.ComplaintProcessLog;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 投诉处理记录DAO
 */
public class ComplaintProcessLogDaoImpl extends HibernateDaoSupport implements ComplaintProcessLogDao {
    @Override
    public List<ComplaintProcessLog> findByComplaintId(long complaintId) {
        //通过ID查询数据库，前提必须继承HibernateDaoSupport  getCanonicalName是获取所传类从java语言规范定义的格式输出
    	return getHibernateTemplate().find("from " + ComplaintProcessLog.class.getCanonicalName()+" where complaintId = ?",complaintId);
    }

    @Override
    public void save(ComplaintProcessLog log) {
    	//保存实体类
        getHibernateTemplate().save(log);
    }
}
