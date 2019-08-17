package com.SLJMH.service.impl;


import java.util.List;

import com.SLJMH.dao.MenuDao;
import com.SLJMH.dao.impl.MenuDaoImpl;
import com.SLJMH.entity.Menu;
import com.SLJMH.service.MenuService;


public class MenuServiceImpl extends BaseServiceImpl<Menu> implements MenuService {
	
	private MenuDao menuDaoImpl = null;
	public void setMenuDaoImpl(MenuDaoImpl menuDaoImpl) {
		 super.setBaseDaoImpl(menuDaoImpl);   
		 this.menuDaoImpl = menuDaoImpl;
	}
	@Override
	public List<Menu> findUseMenu(int roleid) {
		// TODO Auto-generated method stub
		return menuDaoImpl.findUseMenu(roleid);
	}
	@Override
	public Menu findById(int id) {
		// TODO Auto-generated method stub
		return menuDaoImpl.findById(id);
	}
	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		menuDaoImpl.deleteById(id);
	}







}
