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
										<h4><i class="fa fa-bars"></i>相册库</h4>
										<div class="tools">
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
											<a href="javascript:;" class="collapse">
							 				</a>
											<a href="javascript:;" class="remove">
												<i class="fa fa-times"></i>
											</a>
										</div>
									</div>
									 
								
									<div class="box-body clearfix">
									<c:choose>
										<c:when test="${user.userName=='张学友'}">
										
											<div id="filter-items" >
											<c:forEach items="${Album}" var="album" varStatus="status" >
											<div class="col-md-2">
												<div class="filter-content">
												<span class="label label-danger arrow-in arrow-in-right">
														${album.albumID}、${album.albumuserName}：${album.albumName} 
												</span>
												<br>
	 											<img  width="145" height="125" src="<%=basePath%>${album.albumPic}" />
														<p>相册标签：${album.albumTag}</p>
														<p>创建时间：${album.albumDatetime}</p>
												</div>
												<td class="center">
												
												
													  <a  href="${pageContext.request.contextPath}/AlbumServlet?album=update&flag=flag&albumID=${album.albumID}">
												      <button type="button" class="btn btn-warning btn-xs">修改</button>
											         </a>
													
													 
													</td>
											</div>
											</c:forEach> 
											
											
										</div> 
										
										
										</c:when>
										
										
										<c:when test=""></c:when>
										
										
										<c:otherwise>
										
										
												<div id="filter-items" >
											<c:forEach items="${Album}" var="album" varStatus="status" >
											<c:if test="${album.albumuserName==user.userName}">
											<div class="col-md-2">
												<div class="filter-content">
												<span class="label label-danger arrow-in arrow-in-right">
														${album.albumID}、${album.albumName} 
												</span>
										
	 											<a href="${pageContext.request.contextPath}/UploadServlet?file=list">
	 											<img  width="145" height="125" src="<%=basePath%>${album.albumPic}" />
	 											
	 											</a>
														<p>标签：${album.albumTag}</p>
												</div>
												<td class="center">
												
												
													  <a  href="${pageContext.request.contextPath}/AlbumServlet?album=update&flag=flag&albumID=${album.albumID}">
												      <button type="button" class="btn btn-warning btn-xs">修改</button>
											         </a>
													 <a id="deletealbum" onclick="javascript:return  sureDelete()" href="${pageContext.request.contextPath}/AlbumServlet?album=delete&albumID=${album.albumID}">
													 <button type="button" class="btn btn-danger btn-xs">
											                         删除</button>
											          </a>
													 
													</td>
											</div>
											</c:if>
											</c:forEach> 
											
											<a  href="${pageContext.request.contextPath}/AlbumServlet?album=add&flag=flag&albumID=${album.albumID}">
												      <button type="button" class="btn btn-warning btn-xs">增加相册</button>
											         </a>
										</div> 
										
										
										
										</c:otherwise>
									</c:choose>
									
									
										
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