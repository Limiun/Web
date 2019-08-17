package com.SLJMH.entity;

import java.util.List;

public class Role {
private Integer roleId;	 //角色ID
private String roleName;    //角色名称
private String roleDesc;    //角色描述
private List<Integer> roleUsers;//角色 成员
private List<Integer> roleMenus;//角色 菜单
public List<Integer> getRoleUsers() {
	return roleUsers;
}
public void setRoleUsers(List<Integer> roleUsers) {
	this.roleUsers = roleUsers;
}

public Integer getRoleId() {
	return roleId;
}
public void setRoleId(Integer roleId) {
	this.roleId = roleId;
}
public String getRoleName() {
	return roleName;
}
public void setRoleName(String roleName) {
	this.roleName = roleName;
}
public List<Integer> getRoleMenus() {
	return roleMenus;
}
public void setRoleMenus(List<Integer> roleMenus) {
	this.roleMenus = roleMenus;
}
@Override
public String toString() {
	return "Role [roleId=" + roleId + ", roleName=" + roleName + ", roleUsers="
			+ roleUsers + ", roleMenus=" + roleMenus + "]";
}
public String getRoleDesc() {
	return roleDesc;
}
public void setRoleDesc(String roleDesc) {
	this.roleDesc = roleDesc;
}

}
