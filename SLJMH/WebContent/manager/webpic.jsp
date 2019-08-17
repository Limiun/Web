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
    <script type="text/javascript">
    function sureDelete(){
    	 var r=confirm("确定删除？");
    	  if (r==true) {
    		   return true;
    	    }
    	  else{
    		  return false;
    	    }
    	
     }
    </script>
    
     <script type="text/javascript">
      function getData(id,sourceUrl,url,info1,info2,info3){
    	   $("#picUpdateForm").find("#picId").val(id);
    	   $("#picUpdateForm").find("#picSourceUrl").val(sourceUrl);
    	   $("#picUpdateForm").find("#picUrl").val(url);
    	   $("#picUpdateForm").find("#picInfo1").val(info1);
    	   $("#picUpdateForm").find("#picInfo2").val(info2);
    	   $("#picUpdateForm").find("#picInfo3").val(info3);
     }
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
					  <h4 class="modal-title">添加首页图片</h4>
					</div>

				<form id="picAddForm" action="${pageContext.request.contextPath}/WebPicServlet?webpic=add" method="post">
					<div class="modal-body">

						<div class="form-group">
							<label for="exampleInputEmail1">图片来源链接</label> 
							<input type="text"	 name= "picSourceUrl" class="form-control" id="picSourceUrl" placeholder="url">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">图片链接地址</label> <input type="text"
								class="form-control" name="picUrl" id="picUrl" placeholder="url">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">图片说明1</label> <input type="text"
								class="form-control" name="picInfo1" id="picInfo1" placeholder="text">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">图片说明2</label> <input type="text"
								class="form-control" name="picInfo2" id="picInfo2" placeholder="text ">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">图片说明3</label> <input type="text"
								class="form-control" name="picInfo3" id="picInfo3" placeholder="text ">
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
					  <h4 class="modal-title">修改首页图片</h4>
					</div>

				<form id="picUpdateForm" action="${pageContext.request.contextPath}/WebPicServlet?webpic=update" method="post">
					<div class="modal-body">
						<div class="form-group">
							<label for="exampleInputEmail1">图片来源链接</label> 
							<input type="text"	 name= "picSourceUrl" class="form-control" id="picSourceUrl" placeholder="url">
							<input type="hidden" name= "picId" class="form-control" id="picId" >
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">图片链接地址</label> <input type="text"
								class="form-control" name="picUrl" id="picUrl" placeholder="url">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">图片说明1</label> <input type="text"
								class="form-control" name="picInfo1" id="picInfo1" placeholder="text">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">图片说明2</label> <input type="text"
								class="form-control" name="picInfo2" id="picInfo2" placeholder="text ">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">图片说明3</label> <input type="text"
								class="form-control" name="picInfo3" id="picInfo3" placeholder="text ">
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
										<h3 class="content-title pull-left">首页管理</h3>
									</div>
									<div class="description">---</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<!-- BOX -->
								<div class="box border red">
									<div class="box-title">
										<h4><i class="fa fa-sitemap"></i>图片列表</h4>
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
												    <th class="center">图片</th>
													<th class="center">图片说明1</th>
												    <th class="center">图片说明2</th>
													<th class="center">图片说明3</th>
													<th class="center">操作</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${Pics}" var="pics" varStatus="status">
												<tr class="gradeX" >
													<td class="center">
													<a href="${pics.picUrl}"  target="_BLACK">
													<img width="55" height="50"  src="${pics.picSourceUrl}"/>
							                       </a>
							                        </td>
													<td class="center">${pics.picInfo1}</td>
													<td class="center">${pics.picInfo2}</td>
													<td class="center">${pics.picInfo3}</td>
													<td class="center hidden-xs">
													 <a onclick="getData(${pics.picId},'${pics.picSourceUrl}','${pics.picUrl}','${pics.picInfo1}','${pics.picInfo2}','${pics.picInfo3}')"  
													 href="#box-update" data-toggle="modal" class="config">
												      <button type="button" class="btn btn-primary ">修改</button>
											         </a>
													 <a id="deletepic" onclick="javascript:return  sureDelete()" href="${pageContext.request.contextPath}/WebPicServlet?webpic=delete&picId=${pics.picId}">
													 <button type="button" class="btn btn-danger">
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
		jQuery(document).ready(function() {		
			App.setPage("dynamic_table");  //Set current page
			App.init(); //Initialise plugins and elements
		});
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>