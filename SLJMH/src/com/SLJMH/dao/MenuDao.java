package com.SLJMH.dao;

import java.util.List;
import com.SLJMH.entity.Menu;


public interface MenuDao extends BaseDao<Menu> {

	List<Menu> findUseMenu(int roleid);

	//根据id查找菜单
	Menu findById(int id);

	void deleteById(int id);
}
