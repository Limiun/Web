package com.SLJMH.dao;

import com.SLJMH.entity.Mood;

public interface MoodDao {
	
	//根据心情id查找心情
	Mood findById(int id);
	//根据心情发布的username查找心情
	Mood findByuserName(String userName);

}
