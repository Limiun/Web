package com.SLJMH.entity;

import java.util.List;

public class Menu {
private Integer menuId;	 //菜单ID
private String menuName; //菜单名称
private Integer menuFather;//父菜单
private String menuUrl;//菜单URL
private String menuPic;//菜单图片
private Integer    menuOrder;//菜单排序
private List<Menu> childMenus;//子菜单
public Integer getMenuId() {
	return menuId;
}
public void setMenuId(Integer menuId) {
	this.menuId = menuId;
}
public String getMenuName() {
	return menuName;
}
public void setMenuName(String menuName) {
	this.menuName = menuName;
}
public Integer getMenuFather() {
	return menuFather;
}
public void setMenuFather(Integer menuFather) {
	this.menuFather = menuFather;
}
public String getMenuUrl() {
	return menuUrl;
}
public void setMenuUrl(String menuUrl) {
	this.menuUrl = menuUrl;
}
public String getMenuPic() {
	return menuPic;
}
public void setMenuPic(String menuPic) {
	this.menuPic = menuPic;
}
public Integer getMenuOrder() {
	return menuOrder;
}
public void setMenuOrder(Integer menuOrder) {
	this.menuOrder = menuOrder;
}
public List<Menu> getChildMenus() {
	return childMenus;
}
public void setChildMenus(List<Menu> childMenus) {
	this.childMenus = childMenus;
}
@Override
public String toString() {
	return "Menu [menuId=" + menuId + ", menuName=" + menuName
			+ ", menuFather=" + menuFather + ", menuUrl=" + menuUrl
			+ ", menuPic=" + menuPic + ", menuOrder=" + menuOrder
			+ ", childMenus=" + childMenus + "]";
}

}
