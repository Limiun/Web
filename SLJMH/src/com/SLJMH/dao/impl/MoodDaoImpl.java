package com.SLJMH.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.SLJMH.dao.MoodDao;
import com.SLJMH.entity.Mood;



public class MoodDaoImpl extends BaseDaoImpl<Mood> implements MoodDao {

	//根据心情id查找心情
	@Override
	public Mood findById(int id) {
		// TODO Auto-generated method stub
		List<Mood> moodList=getHibernateTemplate().find("from com.SLJMH.entity.Mood where moodId="+id);
			if(moodList.size()>0){
				return  moodList.get(0);
			}else{
				return  new Mood();
			}
	}

	//根据心情发布的username查找心情
	@Override
	public Mood findByuserName(String userName) {
		// TODO Auto-generated method stub
		List<Mood> moodList=getHibernateTemplate().find("from com.SLJMH.entity.Mood where mooduserName="+userName);
		 if(moodList.size()>0){
			 return  moodList.get(0);
		 }else{
			 return  new Mood();
		 }
	}

}
