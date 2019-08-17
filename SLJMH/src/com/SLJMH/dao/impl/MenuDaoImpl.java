package com.SLJMH.dao.impl;



import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Session;

import com.SLJMH.dao.MenuDao;
import com.SLJMH.entity.Menu;

public class MenuDaoImpl extends BaseDaoImpl<Menu> implements MenuDao{

	@Override
	public List<Menu> findUseMenu(int roleid) {
		// TODO Auto-generated method stub
		
		//思路：对midList 进行整理输出
		List<Menu> menulist=new ArrayList<Menu>();//最终返回的 （与midList、userlist处理后的）
		 // 1- 得到所有的List<Menu>去掉非一级菜单
		List<Menu> allmenu=getHibernateTemplate().find("from com.SLJMH.entity.Menu");
		List<Menu>  midList= new  ArrayList<Menu>();//存放一级菜单
		
		//根据roleid判断出该角色拥有的菜单ID
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession() ;
		List<Integer>  menuId= session.createSQLQuery("SELECT menuid FROM role_menus WHERE roleid="+roleid).list();
		for(int i = 0 ; i < allmenu.size() ; i++) {
			   if(allmenu.get(i).getMenuFather()==1){
				   midList.add(allmenu.get(i));
			   }
			   //先去掉用户选择URL为空的菜单，在menuid中 去掉 
			   if("".equals(allmenu.get(i).getMenuUrl())&&menuId.contains(allmenu.get(i).getMenuId())){
				   menuId.remove(allmenu.get(i).getMenuId());
			   }
			   
		}
	
		 // 2- 将临时的midList(只含有一级菜单)中多余的去掉并添加至最后的menulist
		 // 2-1 对midList中只有一级菜单的Menu,通过查找该角色是否含有该Menu的ID
		  for(int i = 0 ; i < midList.size() ; i++) {
			   if(midList.get(i).getChildMenus().size()==0){
				    if(menuId.contains(midList.get(i).getMenuId())){
				    	 menulist.add(midList.get(i)); 
				    }
				  midList.remove(i);
			   }
			      
			}
	
		 // 2-2 对midList中含有子菜单的一级菜单进行处理，此时midList中已经没有了单纯的一级菜单了
		 // 并且已知menuId中只含有最低级别的菜单：二级菜单(没有子菜单)
		  
		   Iterator midit = midList.iterator();
		   while(midit.hasNext()) {
			   Menu meun=(Menu) midit.next();
			   
			   Iterator childit =  meun.getChildMenus().iterator();
			   while(childit.hasNext()) {
				   Menu cmeun=(Menu) childit.next();
				   //判断是否有三级菜单
				    if(cmeun.getChildMenus().size()==0){
				    	//不含三级菜单,判断是否显示
				    	  if(!menuId.contains(cmeun.getMenuId())){
							   childit.remove();
						   }
				    }else{
				         //直接判断其三级菜单，因为有三级菜单的二级菜单，在开始就被移除menuId
				    	 Iterator sit = cmeun.getChildMenus().iterator();
				    	 while (sit.hasNext()) {
				    		 Menu smeun=(Menu) sit.next();
				    		 if(!menuId.contains(smeun.getMenuId())){
				    			 sit.remove();
							   }
						}
				    	
				    }
 			   }
			     
		   }
		   
		   
		   //3- 处理 勾选了一级菜单下的二级菜单(有三级菜单，但是没有勾选)
		   Iterator it = midList.iterator();
		   while(it.hasNext()) {
			   Menu meun=(Menu) it.next();
			   Iterator childit2 =  meun.getChildMenus().iterator();
			   while(childit2.hasNext()) {
				   Menu cmeun=(Menu) childit2.next();
				   if("".equals(cmeun.getMenuUrl())&&cmeun.getChildMenus().size()==0){
					   childit2.remove();
				   }
			   }
		   }
		   
		   
		   
		  // 4- 将修改后的midList加入menulist
		  for(int i = 0 ; i < midList.size() ; i++){
			  menulist.add(midList.get(i));
		  }
		  
	    	return menulist;
		 
		 
				 
	}

	//根据id查找菜单
	@Override
	public Menu findById(int id) {
		// TODO Auto-generated method stub
		
	    List<Menu> menuList=getHibernateTemplate().find("from com.SLJMH.entity.Menu where menuId="+id);
		return  menuList.get(0);
				
	}

	@Override
	public void deleteById(int id) {
		// TODO Auto-generated method stub
		getHibernateTemplate().delete(findById(id));
		
	}

	@Override
	public void save(Menu entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Menu entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Menu entity) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Menu> getByIds(Integer[] ids) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Menu> findAll(String clazz) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Menu> findByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}
}
	

