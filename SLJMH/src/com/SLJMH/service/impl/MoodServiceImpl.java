package com.SLJMH.service.impl;

import com.SLJMH.dao.MoodDao;
import com.SLJMH.dao.impl.MoodDaoImpl;
import com.SLJMH.entity.Mood;
import com.SLJMH.service.MoodService;

public class MoodServiceImpl extends BaseServiceImpl<Mood> implements MoodService{
	
	
	private MoodDao moodDaoImpl = null;
	public void setMoodDaoImpl(MoodDaoImpl moodDaoImpl) {
		 super.setBaseDaoImpl(moodDaoImpl);   
		 this.moodDaoImpl = moodDaoImpl;
	}
	@Override
	public Mood findById(int id) {
		// TODO Auto-generated method stub
		return moodDaoImpl.findById(id);
	}

	public Mood findByuserName(String userName) {
		// TODO Auto-generated method stub
		return moodDaoImpl.findByuserName(userName);
	}

}
