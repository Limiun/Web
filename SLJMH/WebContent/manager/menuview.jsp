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
	<script type="text/javascript" src="<c:url value="/manager/js/add/menuview.js"/>"></script>
    <script type="text/javascript">
    <%-- var setting = {
			check: {
				enable: true,
				chkStyle: "radio",
				radioType: "all"
			},
			view: {
				dblClickExpand: false
			},
			data: {
				key : {  //节点数据
					  checked : "checked",//zTree 节点数据中保存 check 状态的属性名称。
					  name : "menuName",//zTree 节点数据保存节点名称的属性名称。
					},
				simpleData: {
					enable: true,
					idKey : "menuId",
					pIdKey : "menuFather",
				}
			},
			callback: {
				onClick: onClick,
				onCheck: onCheck
			}
		};
      
		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.checkNode(treeNode, !treeNode.checked, null, true);
			return false;
		}

		function onCheck(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo"),
			nodes = zTree.getCheckedNodes(true),
			v = "";
			for (var i=0, l=nodes.length; i<l; i++) {
				v += nodes[i].menuId + ",";
			}
			if (v.length > 0 ) v = v.substring(0, v.length-1);
			var cityObj = $("#citySel");
			cityObj.attr("value", v);
		}
		 
		  
		function showMenu() {
			var cityObj = $("#citySel");
			var cityOffset = $("#citySel").offset();
			$("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");
			$("body").bind("mousedown", onBodyDown);
		
		}
		 
		function hideMenu() {
			$("#menuContent").fadeOut("fast");
			$("body").unbind("mousedown", onBodyDown);
		}
		function onBodyDown(event) {
			if (!( event.target.id == "citySel" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
				hideMenu();
			}
		}
		
		var zNodes=null;		
		function menuAjax(){
			$.ajax({
	            type : "post",     
	            url : "<%=basePath%>MenuServlet?menu=ajax", 
	            dataType : "json",
	            async:false,
	            success : function(Result) {
	            	zNodes=Result;
	            },
	            error : function(xhr, status, errMsg){
	                 alert("数据传输失败!"+xhr+status+errMsg);
	            }
	        });
		}
		
		$(document).ready(function(){
			menuAjax();
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$("#menuContent").hide();
		}); --%>
		
		
    </script>
    <script type="text/javascript">
   /*  function sureDelete(){
    	 var r=confirm("确定删除(若菜单包含子菜单也将全部删除)？");
    	  if (r==true) {
    		   return true;
    	    }
    	  else{
    		  return false;
    	    }
    	
     } */
    </script>
    
     <script type="text/javascript">
      /* function getData(id,name,url,order){
    	   $("#menuUpdateForm").find("#menuId").val(id);
    	   $("#menuUpdateForm").find("#menuName").val(name);
    	   $("#menuUpdateForm").find("#menuUrl").val(url);
    	   $("#menuUpdateForm").find("#menuOrder").val(order);
     } */
</script>
</head>
<body>
	<!-- PAGE -->
			<!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="box-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
				  <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					  <h4 class="modal-title">添加菜单</h4>
					</div>

				<form id="menuAddForm" action="${pageContext.request.contextPath}/MenuServlet?menu=add" method="post">
					<div class="modal-body">

						<div class="form-group">
							<label for="exampleInputEmail1">菜单名称</label> 
							<input type="text"	 name= "menuName" class="form-control" id="menuName" placeholder="菜单">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">菜单URL</label> <input type="text"
								class="form-control" name="menuUrl" id="menuUrl" placeholder="URL">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">父菜单</label> <input type="text"
								class="form-control" id="citySel" name="menuFather" readonly onclick="showMenu();">
							<div id="menuContent" class="form-group">
								<ul id="treeDemo" class="ztree"></ul>
							</div>
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">菜单序号</label> <input type="text"
								class="form-control" name="menuOrder" id="menuOrder" placeholder="数字：1、2、3 ">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">菜单图标(一级菜单有效)</label> 
							<select multiple
								class="form-control" name="menuPic" >
								<option value="" selected="selected">NULL</option>
								<c:forEach items="${icoList}" var="ico" varStatus="status">
									<option value="${ico.icoName}">${ico.icoName}</option>
								</c:forEach>
							</select>
						</div>

						<div class="panel panel-default">
							<!-- Default panel contents -->
							<div class="panel-heading">图标编码对照表：</div>
							<div class="panel-body">
								<div class="row fontawesome-icon-list">
									<c:forEach items="${icoList}" var="ico" varStatus="status">
										<div class="fa-hover col-md-3 col-sm-4">
											<i class="fa ${ico.icoName}"></i>${ico.icoName}</div>
									</c:forEach>
								</div>
							</div>
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
					  <h4 class="modal-title">修改菜单</h4>
					</div>

				<form id="menuUpdateForm" action="${pageContext.request.contextPath}/MenuServlet?menu=update" method="post">
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">菜单名称</label> 
							<input type="text"	 name= "menuName" class="form-control" id="menuName" value="">
							<input type="hidden" name= "menuId" class="form-control" id="menuId" value="">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">菜单URL</label> <input type="text"
								class="form-control" name="menuUrl" id="menuUrl" value="">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">菜单序号</label> <input type="text"
								class="form-control" name="menuOrder" id="menuOrder" value="">
						</div>
                       <div class="form-group">
							<label for="exampleInputEmail1">菜单图标(一级菜单有效)</label> 
							<select multiple
								class="form-control" name="menuPic" >
								<option value="" selected="selected">NULL</option>
								<c:forEach items="${icoList}" var="ico" varStatus="status">
								<option value="${ico.icoName}">${ico.icoName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="panel panel-default">
							<!-- Default panel contents -->
							<div class="panel-heading">图标编码对照表：</div>
							<div class="panel-body">
								<div class="row fontawesome-icon-list">
									<c:forEach items="${icoList}" var="ico" varStatus="status">
										<div class="fa-hover col-md-3 col-sm-4">
											<i class="fa ${ico.icoName}"></i>${ico.icoName}</div>
									</c:forEach>
								</div>
							</div>
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
										<h3 class="content-title pull-left">菜单管理</h3>
									</div>
									<div class="description">这里写点啥？</div>
								</div>
							</div>
						</div>
						<!-- /PAGE HEADER -->
				<div class="alert  alert-success alert-dismissible" role="alert">
					<button type="button" class="close" data-dismiss="alert"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<strong>慎重修改!</strong>(超级管理员拥有权限)
				</div>
				<!-- TREE VIEW -->
						<div class="row">
							<div class="col-md-12">
								<!-- BOX -->
								<div class="box border red">
									<div class="box-title">
										<h4><i class="fa fa-sitemap"></i>菜单列表</h4>
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
												    <th class="center">菜单ID</th>
													<th class="center">父菜单ID</th>
													<th class="center">菜单名</th>
													<th class="center">菜单URL</th>
													<th class="center">操作</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${userMenuList}" var="menu" varStatus="status">
												<tr class="gradeX" >
													<td>
													${menu.menuId}
													</td>
													<td>${menu.menuFather}
													</td>
													<td class="hidden-xs">${menu.menuName}</td>
													<td class="center">${menu.menuUrl}</td>
													<td class="center hidden-xs">
													 <a onclick="getData(${menu.menuId},'${menu.menuName}','${menu.menuUrl}','${menu.menuOrder}')"  
													 href="#box-update" data-toggle="modal" class="config">
												      <button type="button" class="btn btn-primary btn-xs">修改</button>
											         </a>
													 <a id="deletemenu" onclick="javascript:return  sureDelete()" href="${pageContext.request.contextPath}/MenuServlet?menu=delete&menuId=${menu.menuId}">
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
                        <div class="alert alert-danger" role="alert">
                                                                      添加一级菜单务必填写URL; 添加二级菜单，其父菜单无URL;如果二级菜单没有子菜单，其URL为必填；
					          如果二级菜单有子菜单，其URL为空且子菜单URL必填；
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
	<%-- <!-- DATE RANGE PICKER -->
		<script src="<c:url value="/manager/js/bootstrap-daterangepicker/moment.min.js"/>"></script>
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