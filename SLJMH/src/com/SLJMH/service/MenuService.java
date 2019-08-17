package com.SLJMH.service;

import java.util.List;

import com.SLJMH.entity.Menu;



public interface  MenuService extends  BaseService<Menu> {

	List<Menu> findUseMenu(int roleid);

	Menu findById(int id);

	void deleteById(int parseInt);




}
