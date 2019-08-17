<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
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
										
						
						<!-- GALLERY -->
						<div class="row">
							<div class="col-md-12">
								<!-- BOX -->
								<div class="box">
									<div class="box-title">
										<h4><i class="fa fa-bars"></i>图片库[请手动复制图片URL]</h4>
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
										
										
										<c:forEach items="${Files}" var="fs" varStatus="status">
												<c:choose >
												<c:when test="${user.userName=='张学友'}">
													<div class="col-md-2">
													<div class="filter-content">
													<span class="label label-danger arrow-in arrow-in-right">
														${fs.fileType} 
													</span>
	 											<img  width="145" height="125" src="<%=basePath%>${fs.fileUrl}" />
														图片URL：<input type="text" value="<%=basePath%>${fs.fileUrl}">
												</div>
												</div>
												</c:when>
												<c:when test="${user.userName=='薛增博'}">
												<div class="col-md-2">
													<div class="filter-content">
													<span class="label label-danger arrow-in arrow-in-right">
														${fs.fileType} 
													</span>
	 											<img  width="145" height="125" src="<%=basePath%>${fs.fileUrl}" />
														图片URL：<input type="text" value="<%=basePath%>${fs.fileUrl}">
												</div>
												</div>
												</c:when>
												<c:otherwise>
												    <c:if test="${fs.fileuserName==user.userName}">
												   <div class="col-md-2">
													<div class="filter-content">
													<span class="label label-danger arrow-in arrow-in-right">
														${fs.fileuserName}${fs.fileType} 
													</span>
	 											<img  width="145" height="125" src="<%=basePath%>${fs.fileUrl}" />
															图片URL：<input type="text" value="<%=basePath%>${fs.fileUrl}">
												</div>
												</div>
												    
												    </c:if>
												
												
												</c:otherwise>
												</c:choose>
											
										  </c:forEach>
										
										
										
										
										
										
										
										
											<c:forEach items="${Files}" var="fs" varStatus="status" >
											<div class="col-md-2">
												<div class="filter-content">
												<span class="label label-danger arrow-in arrow-in-right">
														${fs.fileType} 
												</span>
	 											<img  width="145" height="125" src="<%=basePath%>${fs.fileUrl}" />
														图片URL：<input type="text" value="<%=basePath%>${fs.fileUrl}">
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
			App.setPage("dropzone_file_upload");  //Set current page
			App.init(); //Initialise plugins and elements
		});
	</script>
	<!-- /JAVASCRIPTS -->
	<!-- CKEDITOR -->
	</body>
</html>