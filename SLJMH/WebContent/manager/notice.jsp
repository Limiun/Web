<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Cloud Admin | Wizards & Validations</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">



<!-- JQUERY UI-->
<link rel="stylesheet" type="text/css"
	href="js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css" />
<!-- STYLESHEETS -->
<!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
<link rel="stylesheet" type="text/css" href="css/cloud-admin.css">
<link rel="stylesheet" type="text/css" href="css/themes/default.css"
	id="skin-switcher">
<link rel="stylesheet" type="text/css" href="css/responsive.css">

<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
<!-- DATE RANGE PICKER -->
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
<!-- SELECT2 -->
<link rel="stylesheet" type="text/css" href="js/select2/select2.min.css" />
<!-- UNIFORM -->
<link rel="stylesheet" type="text/css"
	href="js/uniform/css/uniform.default.min.css" />
<!-- WIZARD -->
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-wizard/wizard.css" />
<!-- MARKDOWN -->
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-markdown/css/bootstrap-markdown.min.css" />
<!-- DATE PICKER -->
<link rel="stylesheet" type="text/css"
	href="js/datepicker/themes/default.min.css" />
<link rel="stylesheet" type="text/css"
	href="js/datepicker/themes/default.date.min.css" />
<link rel="stylesheet" type="text/css"
	href="js/datepicker/themes/default.time.min.css" />
<link rel="stylesheet" type="text/css"
	href="js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
<!-- DATA TABLES -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/js/datatables/media/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/js/datatables/media/assets/css/datatables.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/js/datatables/extras/TableTools/media/css/TableTools.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/css/zTreeStyle.css"/>">
</head>
<body>

	<!-- PAGE -->
	<div class="container">
		<div class="row">
			<div id="content" class="col-lg-12">
				<!-- PAGE HEADER-->
				<div class="row">
					<div class="col-sm-12">
						<div class="page-header">
							<div class="clearfix">
								<h3 class="content-title pull-left">系统公告</h3>
							</div>
							<div class="description">发送公告时候，最好不要勾选超级管理员！</div>
						</div>
					</div>
				</div>
				<!-- /PAGE HEADER -->
				<!-- SAMPLE -->
				<div class="row">
					<div class="col-md-12">
						<!-- BOX -->
						<div class="box border red" id="formWizard">
							<div class="box-title">
								<h4>
									<i class="fa fa-bars"></i>公告
								</h4>
							</div>
							<div class="box-body form">
								<form id="wizForm"  method="post" action="${pageContext.request.contextPath}/NoticeServlet?notice=add"
									class="form-horizontal">
									<div class="wizard-form">
										<div class="wizard-content">
											<ul class="nav nav-pills nav-justified steps">
												<li><a href="#account" data-toggle="tabs"
													class="wiz-step"> <span class="step-number">1</span> <span
														class="step-name"><i class="fa fa-check"></i> 编辑内容
													</span>
												</a></li>

												<li><a href="#confirm" data-toggle="tabs"
													class="wiz-step"> <span class="step-number">2</span> <span
														class="step-name"><i class="fa fa-check"></i>
															选择用户提交 </span>
												</a></li>
											</ul>
											<div id="bar"
												class="progress progress-striped progress-sm active"
												role="progressbar">
												<div class="progress-bar progress-bar-warning"></div>
											</div>
											<div class="tab-content">
												<div class="tab-pane active" id="account">
													<div class="form-group">
														<label class="control-label col-md-1">标题<span
															class="required">*</span></label>
														<div class="col-md-8">
															<input type="text" class="form-control" name="noticeTitle"
																placeholder="Please provide your title" /> <span
																class="error-span"></span>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-md-1">时间<span
															class="required">*</span></label>
														<div class="col-md-3">
															<input class="form-control datepicker" type="text"
																name="noticeDate" placeholder="Please provide datetime"
																size="10"> <span class="error-span"></span>
														</div>
													</div>
													<!-- BOOTSTRAP WYSIWYG -->
													<div class="row">
														<div class="col-md-12">
															<!-- BOX -->
															<div class="box border white">
																<div class="box-title">
																	<h4>
																		<i class="fa fa-pencil-square-o"></i>公告内容
																	</h4>
																</div>
																<div class="box-body">
																	<textarea class="ckeditor"  id="editor1" name="noticeContent"></textarea>
																</div>
															</div>
															<!-- /BOX -->
														</div>
													</div>
													<!-- BOOTSTRAP WYSIWYG -->
												</div>
												<div class="tab-pane" id="confirm">
													<div class="well">
														<div class="box border purple">
															<div class="box-title">
																<h4>
																	<i class="fa fa-sitemap"></i>用户列表
																</h4>
																<div class="tools hidden-xs">
																	<a href="javascript:;" class="collapse"> <i
																		class="fa fa-chevron-up"></i>
																	</a>
																</div>
															</div>
															<div class="box-body">
																<table id="datatable1" cellpadding="0" cellspacing="0"
																	border="0"
																	class="datatable table table-striped table-bordered table-hover">
																	<thead>
																		<tr>
																			<th class="center">
																			<input type="button" id="checkall" class="btn btn-default btn-xs"
																				name="checkall" value="全选" /> 
																			<input type="button"  class="btn btn-default btn-xs"
																				id="delcheckall" name="delcheckall" value="取消" />
																			</th>
																			<th class="center">用户名</th>
																			<th class="center">昵称</th>
																			<th class="center">邮箱</th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach items="${userList}" var="user"
																			varStatus="status">
																			<tr class="gradeX">
																				<td class="center">
																					<div id="div">
																					<input type="checkbox" name="userId"  value="${user.userId}"
																							name="userid">
																					</div>
																				</td>
																				<td>${user.userName}</td>
																				<td>${user.userNickName}</td>
																				<td>${user.userEmail}</td>

																			</tr>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
														</div>
														<!-- /BOX -->
													</div>
												</div>
											</div>
										</div>
										<div class="wizard-buttons">
											<div class="row">
												<div class="col-md-12">
													<div class="col-md-offset-3 col-md-9">
														<a href="javascript:;" class="btn btn-default prevBtn">
															<i class="fa fa-arrow-circle-left"></i> 上一步
														</a> <a href="javascript:;" class="btn btn-primary nextBtn">
															下一步 <i class="fa fa-arrow-circle-right"></i>
														</a> 
													 	 <a href="javascript:;"  class="btn btn-success submitBtn">  
															 提交<i class="fa fa-arrow-circle-right"></i>																																											
												 </a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
						<!-- /BOX -->
					</div>
				</div>
				<!-- /SAMPLE -->
			</div>
			<!-- /CONTENT-->
		</div>
	</div>
	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="js/jquery/jquery-2.0.3.min.js"></script>
	<!-- JQUERY UI-->
	<script
		src="js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="bootstrap-dist/js/bootstrap.min.js"></script>
	<!-- DATE RANGE PICKER -->
	<script src="js/bootstrap-daterangepicker/moment.min.js"></script>
	<script src="js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript"
		src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<script type="text/javascript"
		src="js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- BLOCK UI -->
	<script type="text/javascript"
		src="js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
	<!-- SELECT2 -->
	<script type="text/javascript" src="js/select2/select2.min.js"></script>
	<!-- UNIFORM -->
	<script type="text/javascript" src="js/uniform/jquery.uniform.min.js"></script>
	<!-- WIZARD -->
	<script src="js/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
	<!-- WIZARD -->
	<script src="js/jquery-validate/jquery.validate.min.js"></script>
	<script src="js/jquery-validate/additional-methods.min.js"></script>
	<!-- BOOTBOX -->
	<script type="text/javascript" src="js/bootbox/bootbox.min.js"></script>
	<!-- CKEDITOR -->
	<!-- BOOTSTRAP WYSIWYG -->
	<script type="text/javascript"
		src="js/bootstrap-wysiwyg/jquery.hotkeys.min.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-wysiwyg/bootstrap-wysiwyg.min.js"></script>
	<!-- MARKDOWN -->
	<script type="text/javascript"
		src="js/bootstrap-markdown/js/markdown.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-markdown/js/to-markdown.js"></script>
	<script type="text/javascript"
		src="js/bootstrap-markdown/js/bootstrap-markdown.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript"
		src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<script type="text/javascript"
		src="js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript"
		src="js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="js/script.js"></script>
	<!-- CKEDITOR -->
	<script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
	<script src="js/bootstrap-wizard/form-wizard.js"></script>
	<!-- DATA TABLES -->
	<script
		src="<c:url value="/manager/js/datatables/media/js/jquery.dataTables.min.js"/>"></script>
	<script
		src="<c:url value="/manager/js/datatables/media/assets/js/datatables.min.js"/>"></script>
	<script
		src="<c:url value="/manager/js/datatables/extras/TableTools/media/js/TableTools.min.js"/>"></script>
	<script
		src="<c:url value="/manager/js/datatables/extras/TableTools/media/js/ZeroClipboard.min.js"/>"></script>
	<script>
		jQuery(document).ready(function() {
			App.setPage("wizards_validations"); //Set current page
			App.init(); //Initialise plugins and elements
			FormWizard.init();
		});
	</script>
	<script>
	$(function() {  
	    $("#checkall").click(function() {  
	        $("input[name='userId']").each(function() {  
	           $(this).prop("checked", true); 
	        }); 
	    }); 
	    $("#delcheckall").click(function() {  
	        $("input[name='userId']").each(function() {  
	            $(this).prop("checked", false); 
	        }); 
	    }); 
	})
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>