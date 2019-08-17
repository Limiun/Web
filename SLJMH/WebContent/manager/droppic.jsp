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
	<title>Cloud Admin | Dropzone File Upload</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link rel="stylesheet" type="text/css" href="css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="css/themes/default.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="css/responsive.css" >
	
	<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
	<!-- DROPZONE -->
	<link rel="stylesheet" type="text/css" href="js/dropzone/dropzone.min.css" />
	<!-- ANIMATE -->
	<link rel="stylesheet" type="text/css" href="css/animatecss/animate.min.css" />
	<!-- COLORBOX -->
	<link rel="stylesheet" type="text/css" href="js/colorbox/colorbox.min.css" />
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
										<h3 class="content-title pull-left">图片上传</h3>
									</div>
									<div class="description">单个文件最大为5M,一次可上传8个文件</div>
								</div>
							</div>
						</div>
						<!-- /PAGE HEADER -->
						<!-- DROPZONE -->
						<div class="row">
							<div class="col-md-12">
								<!-- BOX -->
								
								<div class="box border blue">
									<div class="box-title">
										<h4><i class="fa fa-cloud-download"></i>
										上传器</h4>
										
										
										
											
										<div class="tools hidden-xs">
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
											<a href="javascript:;" class="collapse">
												<i class="fa fa-chevron-up"></i>
											</a>
											<a href="javascript:;" class="remove">
												<i class="fa fa-times"></i>
											</a> 
										</div>
									</div>
									<div class="box-body">
										<form action="${pageContext.request.contextPath}/UploadServlet?file=add&type=pic"
										  class="dropzone"
										  id="my-awesome-dropzone" enctype="multipart/form-data">
										  <div>
										
											<input type="text" name="filealbumName" class="form-control" placeholder="Text input">
											<input type="text" name="fileuserName" class="form-control" placeholder="Text input" value="${user.userName}">
											
											</div>
											<div class="fallback">
												<input name="file" type="file" multiple="multiple" />
											</div>
											
										  </form>
								   <a  href="${pageContext.request.contextPath}/UploadServlet?file=list" target="main_Frame">
									<button class="btn btn-block btn-yellow"> 
									<i class="fa fa-refresh">
									</i>
									</button>
									</a>
									</div>
								
								</div>
								
								<!-- /BOX -->
							</div>
						</div>
										
						
						<!-- /DROPZONE -->
						<!-- GALLERY -->
						<div class="row">
							<div class="col-md-12">
								<!-- BOX -->
								<div class="box">
									<div class="box-title">
										<h4><i class="fa fa-bars"></i>图片库</h4>
										<div class="tools">
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
											<a href="javascript:;" class="collapse">
												<i class="fa fa-chevron-up"></i>
											</a>
											<a href="javascript:;" class="remove">
												<i class="fa fa-times"></i>
											</a>
										</div>
									</div>
									
								
									<div class="box-body clearfix">
										<div id="filter-items" >
											<c:forEach items="${Files}" var="fs" varStatus="status" >
											<div class="col-md-2">
												<div class="filter-content">
												<span class="label label-danger arrow-in arrow-in-right">
														${fs.fileType} 
												</span>
	 											<img  width="145" height="125" src="<%=basePath%>${fs.fileUrl}" />
													
													<div class="hover-content">
														<h6>${fs.fileName}</h6>
														<a class="btn btn-danger hover-link" href="${pageContext.request.contextPath}/UploadServlet?file=delete&fileId=${fs.fileId}">
															<i class="fa fa-times fa-1x"></i>
														</a>
														<a class="btn btn-warning hover-link colorbox-button" href="<%=basePath%>${fs.fileUrl}" title="${fs.fileName}">
															<i class="fa fa-search-plus fa-1x"></i>
														</a>
														
													</div>
												</div>
											</div>
											</c:forEach> 
										</div>
									</div>
								
								</div>
								
								<!-- /BOX -->
							</div>
						</div>
						<!-- /GALLERY -->
						
						
					</div><!-- /CONTENT-->
				</div>
			</div>
	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="js/jquery/jquery-2.0.3.min.js"></script>
	<!-- JQUERY UI-->
	<script src="js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="bootstrap-dist/js/bootstrap.min.js"></script>
	<!-- DATE RANGE PICKER -->
	<script src="js/bootstrap-daterangepicker/moment.min.js"></script>
	<script src="js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript" src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script><script type="text/javascript" src="js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- BLOCK UI -->
	<script type="text/javascript" src="js/jQuery-BlockUI/jquery.blockUI.min.js"></script>
	<!-- DROPZONE -->
	<script type="text/javascript" src="js/dropzone/dropzone.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="js/script.js"></script>
	<!-- ISOTOPE -->
	<script type="text/javascript" src="js/isotope/jquery.isotope.min.js"></script>
	<script type="text/javascript" src="js/isotope/imagesloaded.pkgd.min.min.js"></script>
	<!-- COLORBOX -->
	<script type="text/javascript" src="js/colorbox/jquery.colorbox.min.js"></script>
	<script>
		jQuery(document).ready(function() {		
			App.setPage("dropzone_file_upload");  //设置当前页
			App.init(); //初始化插件和元素
		});
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>