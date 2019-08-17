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
	<script type="text/javascript" src="<c:url value="/manager/js/add/userview.js"/>"></script>
	
	
	
    
</head>
<body>
	<!-- PAGE -->
			<!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="box-update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
				  <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					  <h4 class="modal-title">修改用户</h4>
					</div>

				<form id="userUpdateForm" action="${pageContext.request.contextPath}/UserServlet?user=update" method="post">
					<div class="modal-body">
						<div class="form-group">
							<!-- <label for="exampleInputEmail1">用户名称</label>  -->
							<input type="hidden" name= "userName" class="form-control" id="userName" value="">
							<input type="hidden" name= "userId" class="form-control" id="userId" value="">
							<input type="hidden" name= "userNickName" class="form-control" id="userNickName" value="">
							<input type="hidden" name= "userEmail" class="form-control" id="userEmail" value="">
							<input type="hidden"  name="userPassWord" class="form-control" id="userPassWord"  value="">
							<input type="hidden" name= "userPic" class="form-control" id="userPic" value="">
						 	<input type="hidden" name= "userIdentify" class="form-control" id="userIdentify" value="">
							<input type="hidden" name= "userTrueName" class="form-control" id="userTrueName" value="">
							<input type="hidden" name= "userBirthday" class="form-control" id="userBirthday" value="">
							<input type="hidden" name= "userSex" class="form-control" id="userSex" value="">
							<input type="hidden" name= "userStar" class="form-control" id="userStar" value="">
							<input type="hidden" name= "userBlood" class="form-control" id="userBlood" value="">
							<input type="hidden" name= "userCharacter" class="form-control" id="userCharacter" value="">
							<input type="hidden" name= "userHobby" class="form-control" id="userHobby" value="">
							<input type="hidden" name= "userJob" class="form-control" id="userJob" value=""> 
							
						</div>
			
						<div class="form-group"> -->
							<label for="exampleInputEmail1">状态修改理由</label> <input type="text"
								class="form-control" name="userStateReason" id="userPassWord">
						</div> 
                        <div class="form-group">
							<label for="exampleInputEmail1">角色</label> 
							<select multiple class="form-control" name="userRole" >
								<c:forEach items="${roleList}" var="role" varStatus="status">
									<option value="${role.roleId}">${role.roleName}</option>
								</c:forEach>
							</select>
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
										<h3 class="content-title pull-left">用户管理</h3>
									</div>
									<div class="description">欢迎使用</div>
								</div>
							</div>
						</div>
						<!-- /PAGE HEADER -->
				<!-- TREE VIEW -->
						<div class="row">
							<div class="col-md-12">
								<!-- BOX -->
								<div class="box border purple">
									<div class="box-title">
										<h4><i class="fa fa-sitemap"></i>用户列表</h4>
										<div class="tools hidden-xs">
											<a href="javascript:;" class="collapse">
												<i class="fa fa-chevron-up"></i>
											</a>
										</div>
									</div>
									<div class="box-body">
										<table id="datatable1" cellpadding="0" cellspacing="0" border="0" class="datatable table table-striped table-bordered table-hover">
											<thead>
												<tr>
												    <th class="center">用户名</th>
													<th class="center">昵称</th>
													<th class="center">邮箱</th>
													<!-- <th class="center">密码</th> -->
													<th class="center">头像</th>
													<th class="center">身份证号</th>
													<th class="center">真名</th>
													<th class="center">生日</th>
													<th class="center">性别</th>
													<th class="center">星座</th>
													<th class="center">血型</th>
													<th class="center">性格</th>
													<th class="center">爱好</th>
													<th class="center">职业</th>
													<th class="center">状态修改理由</th>
													<th class="center">操作</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${userList}" var="user" varStatus="status">
												<tr class="gradeX" >
													<td>${user.userName}&nbsp; &nbsp;[ID:${user.userId}]</td>
													<td>${user.userNickName}</td>
													<td>${user.userEmail}<input type="hidden"  name="userPassWord"></td> 
													<%-- <td>${user.userPassWord}</td>  --%>
													<!-- <input type="hidden"  name="userPassWord"> -->
												    <td><img src="${user.userPic}">	</td>
													<td>${user.userIdentify}</td>
													<td>${user.userTrueName}</td>
													<td>${user.userBirthday}</td>
													<td>${user.userSex}</td>
													<td>${user.userStar}</td>
													<td>${user.userBlood}</td>
													<td>${user.userCharacter}</td>
													<td>${user.userHobby}</td>
													<td>${user.userJob}</td>
													<%-- <td>${user.userRole}</td> --%>
													<td>${user.userStateReason}</td>
													
													<td class="center">
													  <a onclick="getData(${user.userId},'${user.userName}','${user.userNickName}','${user.userEmail}',
													  '${user.userPassWord}','${user.userPic}','${user.userIdentify}',
													  '${user.userTrueName}','${user.userBirthday}','${user.userSex }',
													  '${user.userStar}','${user.userBlood}','${user.userCharacter}',
													  '${user.userHobby}','${user.userJob}','${user.userStateReason}')"  href="#box-update" data-toggle="modal" class="config">
												      <button type="button" class="btn btn-warning btn-xs">修改</button>
											         </a>
													 <%-- <a id="deleterole" onclick="javascript:return  sureDelete()" href="${pageContext.request.contextPath}/UserServlet?user=delete&userId=${user.userId}">
													 <button type="button" class="btn btn-danger btn-xs">
											                         删除</button>
											          </a> --%>
													 
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
	<%-- <script src="<c:url value="/manager/js/bootstrap-daterangepicker/moment.min.js"/>"></script>
	<script src="<c:url value="/manager/js/bootstrap-daterangepicker/daterangepicker.min.js"/>"></script>
	 --%>
<%-- 	<!-- SLIMSCROLL -->
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
	
	<!-- /JAVASCRIPTS -->
</body>
</html>