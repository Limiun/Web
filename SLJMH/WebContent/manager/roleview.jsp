<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>Cloud Admin | Tree View</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	 <link rel="stylesheet" type="text/css" href="<c:url value="/manager/css/cloud-admin.css"/>" >
	<link rel="stylesheet" type="text/css"  href="<c:url value="/manager/css/themes/default.css"/>" id="skin-switcher" >
	<link rel="stylesheet" type="text/css" href="<c:url value="/manager/css/responsive.css"/>" >
	<link rel="stylesheet" type="text/css" href="<c:url value="/manager/font-awesome/css/font-awesome.min.css"/>" >
	<!-- JQUERY UI-->
	<link rel="stylesheet" type="text/css" href="<c:url value="/manager/js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css"/>" >
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/manager/js/bootstrap-daterangepicker/daterangepicker-bs3.css"/>" >
	<!-- DATA TABLES -->
    <link rel="stylesheet" type="text/css" href="<c:url value="/manager/js/datatables/media/css/jquery.dataTables.min.css"/>" >
	<link rel="stylesheet" type="text/css" href="<c:url value="/manager/js/datatables/media/assets/css/datatables.min.css"/>" >
    <link rel="stylesheet" type="text/css" href="<c:url value="/manager/js/datatables/extras/TableTools/media/css/TableTools.min.css"/>" >
    <link rel="stylesheet" type="text/css" href="<c:url value="/manager/css/zTreeStyle.css"/>" > 
    <!-- JQUERY -->
	<script src="<c:url value="/manager/js/jquery/jquery-2.0.3.min.js"/>"></script>
	<script src="<c:url value="/manager/js/jquery/jquery.ztree.core.js"/>"></script>
	<script src="<c:url value="/manager/js/jquery/jquery.ztree.excheck.js"/>"></script>
	<!-- JQUERY UI-->
	<script src="<c:url value="/manager/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"/>"></script>
	<!-- 新增角色时候，构建的菜单树 -->
	<script type="text/javascript" src="<c:url value="/manager/js/add/roleview.js"/>"></script>
    
    
</head>
<body>
	<!-- PAGE -->
			<!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="box-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
				  <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					  <h4 class="modal-title">添加角色</h4>
					</div>

				<form id="roleAddForm" action="${pageContext.request.contextPath}/RoleServlet?role=add" method="post">
					<div class="modal-body">

						<div class="form-group">
							<label for="exampleInputEmail1">角色名称</label> 
							<input type="text"	 name= "roleName" class="form-control" id="roleName" placeholder="Name">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">权限菜单</label> <input type="text"
								class="form-control" id="citySel" name="roleMenus" readonly onclick="showMenu();">
							<div id="menuContent" class="form-group">
								<ul id="treeDemo" class="ztree"></ul>
							</div>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">角色描述</label> <input type="text"
								class="form-control" name="roleDesc" id="roleDesc" placeholder="Desc">
						</div>
						

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<input  type="submit" class="btn btn-primary"/>
					</div>
				</form>
			</div>
				</div>
			  </div>
			<!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
			
			
			
			
			<!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="box-update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
				  <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					  <h4 class="modal-title">修改角色</h4>
					</div>

				<form id="roleUpdateForm" action="${pageContext.request.contextPath}/RoleServlet?role=update" method="post">
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">角色名称</label> 
							<input type="text"	 name= "roleName" class="form-control" id="roleName" value="">
							<input type="hidden" name= "roleId" class="form-control" id="roleId" value="">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">权限菜单</label> <input type="text"
								class="form-control" id="citySel1" name="roleMenus" readonly onclick="showMenu1();">
							<div id="menuContent1" class="form-group">
								<ul id="treeDemo1" class="ztree"></ul>
							</div>
						</div>	
						<div class="form-group">
							<label for="exampleInputEmail1">角色描述</label> <input type="text"
								class="form-control" name="roleDesc" id="roleDesc" value="">
						</div>
                        
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<input  type="submit" class="btn btn-primary"/>
					</div>
				</form>
			</div>
				</div>
			  </div>
			<!-- /SAMPLE BOX CONFIGURATION MODAL FORM-->
			
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<!-- PAGE HEADER-->
						<div class="row">
							<div class="col-sm-12">
								<div class="page-header">
									<div class="clearfix">
										<h3 class="content-title pull-left">角色管理</h3>
									</div>
									<div class="description">确保超级管理员的ID为1，游客的ID为2；</div>
								</div>
							</div>
						</div>
						<!-- /PAGE HEADER -->
				<!-- TREE VIEW -->
						<div class="row">
							<div class="col-md-12">
								<!-- BOX -->
								<div class="box border blue">
									<div class="box-title">
										<h4><i class="fa fa-sitemap"></i>角色列表</h4>
										<div class="tools hidden-xs">
											<a href="#box-config" data-toggle="modal" class="config">
												<i class="fa fa-plus"></i>
											</a>
											<a href="javascript:;" class="collapse">
												<i class="fa fa-chevron-up"></i>
											</a>
										</div>
									</div>
									<div class="box-body">
										<table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
											<thead>
												<tr>
												    <th class="center">角色ID</th>
													<th class="center">角色名</th>
													<th class="center">描述</th>
													<th class="center">修改</th>
													<th class="center">删除</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${roleList}" var="role" varStatus="status">
												<tr class="gradeX" >
													<td>${role.roleId}</td>
													<td>${role.roleName}</td>
													<td>${role.roleDesc}</td> 
													<td class="center">
													  <a onclick="getData(${role.roleId},'${role.roleName}','${role.roleDesc}','${role.roleMenus}')"  href="#box-update" data-toggle="modal" class="config">
												      <button type="button" class="btn btn-warning btn-xs">修改</button>
											         </a>
											         </td>
													<td class="center">
													 <a id="deleterole" onclick="javascript:return  sureDelete()" href="${pageContext.request.contextPath}/RoleServlet?role=delete&roleId=${role.roleId}">
													 <button type="button" class="btn btn-danger btn-xs">
											                         删除</button>
											          </a>
													 
													</td>
												</tr>
										  </c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th></th>
													<th></th>
													<th class="hidden-xs"></th>
													<th></th>
													<th class="hidden-xs"></th>
												</tr>
											</tfoot>
										</table>
									</div>
								</div>
								<!-- /BOX -->
							</div>
						</div>
						<!-- /TREE VIEW  -->
					</div><!-- /CONTENT-->
				</div>
			</div>
	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	
		
	<!-- BOOTSTRAP -->
	<script src="<c:url value="/manager/bootstrap-dist/js/bootstrap.min.js"/>"></script>
	<!-- DATE RANGE PICKER -->
	<%-- 	<script src="<c:url value="/manager/js/bootstrap-daterangepicker/moment.min.js"/>"></script>
		<script src="<c:url value="/manager/js/bootstrap-daterangepicker/daterangepicker.min.js"/>"></script>
	<!-- SLIMSCROLL -->
		<script src="<c:url value="/manager/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"/>"></script>
		<script src="<c:url value="/manager/js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"/>"></script>
	 --%>
	<!-- BLOCK UI -->
		<script src="<c:url value="/manager/js/jQuery-BlockUI/jquery.blockUI.min.js"/>"></script>
	<!-- DATA TABLES -->
		<script src="<c:url value="/manager/js/datatables/media/js/jquery.dataTables.min.js"/>"></script>
		<script src="<c:url value="/manager/js/datatables/media/assets/js/datatables.min.js"/>"></script>
		<script src="<c:url value="/manager/js/datatables/extras/TableTools/media/js/TableTools.min.js"/>"></script>
		<script src="<c:url value="/manager/js/datatables/extras/TableTools/media/js/ZeroClipboard.min.js"/>"></script>
	<!-- COOKIE -->
		<script src="<c:url value="/manager/js/jQuery-Cookie/jquery.cookie.min.js"/>"></script>
	<!-- CUSTOM SCRIPT -->
		<script src="<c:url value="/manager/js/script.js"/>"></script>
		
	<script>
		/* jQuery(document).ready(function() {		
			App.setPage("dynamic_table");  //Set current page
			App.init(); //Initialise plugins and elements
		}); */
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>