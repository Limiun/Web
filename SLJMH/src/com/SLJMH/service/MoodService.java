package com.SLJMH.service;

import com.SLJMH.entity.Mood;

public interface MoodService extends  BaseService<Mood>{
	
	Mood findById(int parseInt);

}
