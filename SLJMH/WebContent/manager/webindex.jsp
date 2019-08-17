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
	<title>Cloud Admin | Forms</title>
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
	<!-- TYPEAHEAD -->
	<link rel="stylesheet" type="text/css" href="js/typeahead/typeahead.css" />
	<!-- FILE UPLOAD -->
	<link rel="stylesheet" type="text/css" href="js/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	<!-- SELECT2 -->
	<link rel="stylesheet" type="text/css" href="js/select2/select2.min.css" />
	<!-- UNIFORM -->
	<link rel="stylesheet" type="text/css" href="js/uniform/css/uniform.default.min.css" />
	<!-- JQUERY UPLOAD -->
	<!-- blueimp Gallery styles -->
	<link rel="stylesheet" href="js/blueimp/gallery/blueimp-gallery.min.css">
	<!-- CSS to style the file input field as button and adjust the Bootstrap progress bars -->
	<link rel="stylesheet" href="js/jquery-upload/css/jquery.fileupload.css">
	<link rel="stylesheet" href="js/jquery-upload/css/jquery.fileupload-ui.css">
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
										<h3 class="content-title pull-left">官网介绍</h3>
									</div>
									<div class="description">官网和品牌介绍</div>
								</div>
							</div>
						</div>
						<!-- /PAGE HEADER -->
						<!-- FORMS -->
						<div class="row">
							<div class="col-md-12">
								<!-- SAMPLE -->
								<div class="row">
									<div class="col-md-12">
										<!-- BOX -->
										<div class="box border red">
											<div class="box-title">
												<h4><i class="fa fa-bars"></i>编辑</h4>
												<div class="tools">
													<a href="javascript:;" class="collapse">
														<i class="fa fa-chevron-up"></i>
													</a>
													<a href="javascript:;" class="remove">
														<i class="fa fa-times"></i>
													</a>
										
												</div>
											</div>
												 
											<div class="box-body">
											 <c:if test="${empty wi}">
												<form class="form-horizontal " action=" ${pageContext.request.contextPath}/WebSiteServlet?website=add" method="post">
												 <div class="form-group">
													<label class="col-md-2 control-label">官网标题:</label>
													<div class="col-sm-10">
													  <input type="text" class="form-control"   name="webTitle" placeholder="Text input" >
													</div>
												  </div>
												   <div class="form-group">
													<label class="col-md-2 control-label">官网概要:</label>
													<div class="col-sm-10">
													  <input type="text" class="form-control" placeholder="Text input" name="webSummary" >
													</div>
												  </div>
												  <div class="form-group">
													 <label class="col-md-2 control-label">官网介绍:</label> 
													 <div class="col-md-10">
													 <textarea   name="webIntroduction" class="autosize form-control"></textarea></div>
												  </div>
												  <hr>
												  <div class="form-group">
													<label class="col-md-2 control-label">品牌标题:</label>
													<div class="col-sm-10">
													  <input type="text" class="form-control" placeholder="Text input" name="brandTitle" >
													</div>
												  </div>
												   <div class="form-group">
													<label class="col-md-2 control-label">品牌概要:</label>
													<div class="col-sm-10">
													  <input type="text" class="form-control" placeholder="Text input" name="brandSummary" >
													</div>
												  </div>
												  <div class="form-group">
													 <label class="col-md-2 control-label">品牌介绍:</label> 
													 <div class="col-md-10">
													  <textarea name="brandIntroduction" class="autosize form-control"></textarea> 
												  </div>
												  </div>
											 <div class="form-group">
											 <label class="col-md-2 control-label" >品牌背景图：</label> 
											 <div class="col-sm-10">
											  <input type="text" class="form-control" placeholder="Text input" name="brandBackPic" value="${wi.brandBackPic}">
											 </div>
										  </div>
										   <div class="form-group">
											 <label class="col-md-2 control-label" >品牌链接博客：</label> 
											 <div class="col-sm-10">
											  <input type="text" class="form-control" placeholder="blog id" name="blogId" >
											 </div>
										  </div>
										  <hr>
										  	 <div class="form-group">
													<label class="col-md-2 control-label">关于我们标题:</label>
													<div class="col-sm-10">
													  <input type="text" class="form-control" placeholder="Text input" name="aboutTitle" >
													</div>
												  </div>
												   <div class="form-group">
													<label class="col-md-2 control-label">关于我们概述:</label>
													<div class="col-sm-10">
													  <input type="text" class="form-control" placeholder="Text input" name="aboutSummary" >
													</div>
												  </div>
												  <div class="form-group">
													 <label class="col-md-2 control-label">关于我们介绍:</label> 
													 <div class="col-md-10">
													 <textarea class="autosize form-control" name="aboutIntroduction" ></textarea></div>
												  </div>
										         <div class="form-group">
													 <label class="col-md-2 control-label">关于我们信息:</label> 
													 <div class="col-md-10"> 
													 <textarea class="autosize form-control" name="aboutInfo"></textarea> </div>
												  </div>
										   <div class="form-group">
											 <label class="col-md-2 control-label" for="e3">图1：</label> 
											 <div class="col-md-10">
												  <input type="text" class="form-control" placeholder="Text input url" name="aboutPic1" >											
											 </div>
										  </div>
										   <div class="form-group">
											 <label class="col-md-2 control-label" for="e4">图2：</label> 
											 <div class="col-md-10">
												<input type="text" class="form-control" placeholder="Text input url" name="aboutPic2" >												
											 </div>
										  </div>
										   <div class="form-group">
											 <label class="col-md-2 control-label" for="e5">图3：</label> 
											 <div class="col-md-10">
  												<input type="text" class="form-control" placeholder="Text input url" name="aboutPic3" >											 </div>
										  </div>
										  
										  
										        <div class="form-group">
													<label class="col-md-4 control-label"></label>
													<div class="col-sm-8">
													<button class="btn btn-danger bnt-xs" type="submit">
													<i class="fa fa-pencil-square-o"></i>新增
												    </button>
													</div>
												  </div>
										
										
												</form>
											</c:if>	
												<c:if test="${not empty wi}">
													<form class="form-horizontal " action=" ${pageContext.request.contextPath}/WebSiteServlet?website=update&sure=sure" method="post">
												 <div class="form-group">
													<label class="col-md-2 control-label">官网标题:</label>
													<div class="col-sm-10">
													  <input type="text" class="form-control"   name="webTitle" placeholder="Text input" value="${wi.webTitle}">
													  <input type="hidden" class="form-control" name="webInfoId" placeholder="Text input" value="${wi.webInfoId}">
													</div>
												  </div>
												   <div class="form-group">
													<label class="col-md-2 control-label">官网概要:</label>
													<div class="col-sm-10">
													  <input type="text" class="form-control" placeholder="Text input" name="webSummary" value="${wi.webSummary}">
													</div>
												  </div>
												  <div class="form-group">
													 <label class="col-md-2 control-label">官网介绍:</label> 
													 <div class="col-sm-10">
													 <textarea name="webIntroduction" class="autosize form-control" >${wi.webIntroduction}</textarea>
													</div>
												  </div>
												  <hr>
												  <div class="form-group">
													<label class="col-md-2 control-label">品牌标题:</label>
													<div class="col-sm-10">
													  <input type="text" class="form-control" placeholder="Text input" name="brandTitle" value="${wi.brandTitle}">
													</div>
												  </div>
												   <div class="form-group">
													<label class="col-md-2 control-label">品牌概要:</label>
													<div class="col-sm-10">
													  <input type="text" class="form-control" placeholder="Text input" name="brandSummary" value="${wi.brandSummary}">
													</div>
												  </div>
												  <div class="form-group">
													 <label class="col-md-2 control-label">品牌介绍:</label> 
													 <div class="col-sm-10">
													  <textarea name="brandIntroduction" class="autosize form-control" >${wi.brandIntroduction}</textarea>  </div>
												  </div>
											 <div class="form-group">
											 <label class="col-md-2 control-label" for="e1">品牌背景图：</label> 
											 <div class="col-md-10">
											  <input type="text" class="form-control" placeholder="Text input" name="brandBackPic" value="${wi.brandBackPic}">
											 </div>
										  </div>
										   <div class="form-group">
											 <label class="col-md-2 control-label" for="e2">品牌链接博客：</label> 
											 <div class="col-md-10">
											  <input type="text" class="form-control" placeholder="blog id" name="blogId" value="${wi.blogId}">
											 </div>
										  </div>
										  <hr/>
										  	 <div class="form-group">
													<label class="col-md-2 control-label">关于我们标题：</label>
													<div class="col-sm-10">
													  <input type="text" class="form-control" placeholder="Text input" name="aboutTitle" value="${wi.aboutTitle}">
													</div>
												  </div>
												   <div class="form-group">
													<label class="col-md-2 control-label">关于我们概述：</label>
													<div class="col-sm-10">
													  <input type="text" class="form-control" placeholder="Text input" name="aboutSummary" value="${wi.aboutSummary}">
													</div>
												  </div>
												  <div class="form-group">
													 <label class="col-md-2 control-label">关于我们介绍:</label> 
													 <div class="col-md-10">
													 <textarea  class="autosize form-control" name="aboutIntroduction" >${wi.aboutIntroduction}</textarea>
													 </div>
												  </div>
										         <div class="form-group">
													 <label class="col-md-2 control-label">关于我们信息:</label> 
													 <div class="col-md-10"> 
													 <textarea   class="countable form-control" name="aboutInfo">${wi.aboutInfo}</textarea></div>
												  </div>
										   <div class="form-group">
											 <label class="col-md-2 control-label" for="e3">图1：</label> 
											 <div class="col-md-10">
												  <input type="text" class="form-control" placeholder="Text input url " name="aboutPic1" value="${wi.aboutPic1}">											
											 </div>
										  </div>
										   <div class="form-group">
											 <label class="col-md-2 control-label" for="e4">图2：</label> 
											 <div class="col-md-10">
												<input type="text" class="form-control" placeholder="Text input url" name="aboutPic2" value="${wi.aboutPic2}">											
											 </div>
										  </div>
										   <div class="form-group">
											 <label class="col-md-2 control-label" for="e5">图3：</label> 
											 <div class="col-md-10">
  												<input type="text" class="form-control" placeholder="Text input url" name="aboutPic3" value="${wi.aboutPic3}">											 </div>
										  </div>
										  
										  
										        <div class="form-group">
													<label class="col-md-4 control-label"></label>
													<div class="col-sm-8">
													<button class="btn btn-danger bnt-xs" type="submit">
													<i class="fa fa-pencil-square-o"></i> 提交修改
												    </button>
													</div>
												  </div>
										
										
												</form>
												</c:if>
											</div>
										</div>
										<!-- /BOX -->
									</div>
								</div>
								<!-- /SAMPLE -->
							</div>
						</div>
						<!-- /FORMS -->
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
	<!-- TYPEHEAD -->
	<script type="text/javascript" src="js/typeahead/typeahead.min.js"></script>
	<!-- AUTOSIZE -->
	<script type="text/javascript" src="js/autosize/jquery.autosize.min.js"></script>
	<!-- COUNTABLE -->
	<script type="text/javascript" src="js/countable/jquery.simplyCountable.min.js"></script>
	<!-- INPUT MASK -->
	<script type="text/javascript" src="js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	<!-- FILE UPLOAD -->
	<script type="text/javascript" src="js/bootstrap-fileupload/bootstrap-fileupload.min.js"></script>
	<!-- SELECT2 -->
	<script type="text/javascript" src="js/select2/select2.min.js"></script>
	<!-- UNIFORM -->
	<script type="text/javascript" src="js/uniform/jquery.uniform.min.js"></script>
	<!-- JQUERY UPLOAD -->
	<!-- The Templates plugin is included to render the upload/download listings -->
	<script src="js/blueimp/javascript-template/tmpl.min.js"></script>
	<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
	<script src="js/blueimp/javascript-loadimg/load-image.min.js"></script>
	<!-- The Canvas to Blob plugin is included for image resizing functionality -->
	<script src="js/blueimp/javascript-canvas-to-blob/canvas-to-blob.min.js"></script>
	<!-- blueimp Gallery script -->
	<script src="js/blueimp/gallery/jquery.blueimp-gallery.min.js"></script>
	<!-- The basic File Upload plugin -->
	<script src="js/jquery-upload/js/jquery.fileupload.min.js"></script>
	<!-- The File Upload processing plugin -->
	<script src="js/jquery-upload/js/jquery.fileupload-process.min.js"></script>
	<!-- The File Upload image preview & resize plugin -->
	<script src="js/jquery-upload/js/jquery.fileupload-image.min.js"></script>
	<!-- The File Upload audio preview plugin -->
	<script src="js/jquery-upload/js/jquery.fileupload-audio.min.js"></script>
	<!-- The File Upload video preview plugin -->
	<script src="js/jquery-upload/js/jquery.fileupload-video.min.js"></script>
	<!-- The File Upload validation plugin -->
	<script src="js/jquery-upload/js/jquery.fileupload-validate.min.js"></script>
	<!-- The File Upload user interface plugin -->
	<script src="js/jquery-upload/js/jquery.fileupload-ui.min.js"></script>
	<!-- The main application script -->
	<script src="js/jquery-upload/js/main.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="js/script.js"></script>
	<script>
		jQuery(document).ready(function() {		
			App.setPage("forms");  //Set current page
			App.init(); //Initialise plugins and elements
		});
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>