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
										<h3 class="content-title pull-left">官网博客</h3>
									</div>
									<div class="description">轻博客:为了更好的前端体验，请为博客添加至少一张图片(500*500像素以上最佳)！</div>
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
											  <c:if test="${empty blog}">
												<form class="form-horizontal" action="${pageContext.request.contextPath}/BlogServlet?blog=add" method="post">
												 <div class="form-group">
													<label class="col-md-1 control-label">标题</label>
													<div class="col-sm-11">
													   <input type="text" name="blogTitle" class="form-control" placeholder="Text input">
													   <input type="hidden" name="bloguserName" class="form-control" value="${user.userName}">
													</div>
												  </div>
												   <div class="form-group">
													<label class="col-md-1 control-label">标签</label>
													<div class="col-sm-11">
													  <input type="text" name="blogTag" class="form-control" placeholder="Text input">
													</div>
												  </div>
												  
												  <div class="form-group">
													 <label class="col-md-1 control-label">摘要</label> 
													 <div class="col-md-11"> 
													  <input type="text" name="blogSummary" class="form-control" placeholder="Text input" > 
			 										
													 </div>
												  </div>
                                                 <!-- CKE -->
								                 <div class="box border grey">
								         	       <div class="box-title">
									      	      <h4><i class="fa fa-pencil-square"></i>内容</h4>
								        	       </div>
									               <div class="box-body">
										           <textarea  class="ckeditor" name="blogContent" id="editor2">
										           </textarea>
									              </div>
								                </div>
							                     	<!-- /CKE -->
												   <div class="form-group">
													<label class="col-md-1 control-label">背景图片</label>
													<div class="col-sm-7">
													<input type="text" id="blogBackPic" name="blogBackPic" class="form-control" placeholder="请选择或输入URL">
													</div>
												      <button   id="findpic" onclick="findPic();" type="button" class="btn btn-warning ">  
												                从本文选择图片    
												      </button>
											      
												  </div>
												  <div class="box border grey" id="ulid">
						                         
											       </div>
												  
										          <div class="form-group">
													<label class="col-md-5 control-label"></label>
													<div class="col-sm-7">
													<button class="btn btn-primary bnt-xs" type="submit">
													<i class="fa fa-pencil-square-o"></i> 提交内容
												    </button>
													</div>
												  </div>
										
												</form>
												
												 </c:if>
												 
												 
												 <c:if test="${not empty blog}">
												<form class="form-horizontal" action="${pageContext.request.contextPath}/BlogServlet?blog=update" method="post">
												 <div class="form-group">
													<label class="col-md-1 control-label">标题</label>
													<div class="col-sm-11">
													   <input type="text" name="blogTitle" class="form-control" placeholder="Text input" value="${blog.blogTitle}">
													   <input type="hidden" name="blogId" class="form-control" placeholder="Text input" value="${blog.blogId}">
													</div>
												  </div>
												   <div class="form-group">
													<label class="col-md-1 control-label">标签</label>
													<div class="col-sm-11">
													  <input type="text" name="blogTag" class="form-control" placeholder="Text input" value="${blog.blogTag}">
													  <input type="hidden" name="bloguserName" class="form-control" value="${user.userName}">
													</div>
												  </div>
												  
												  <div class="form-group">
													 <label class="col-md-1 control-label">摘要</label> 
													 <div class="col-md-11"> 
													 <input type="text" name="blogSummary" class="form-control" placeholder="Text input" value="${blog.blogSummary}"> 
													 </div>
												  </div>
                                                 <!-- CKE -->
								                 <div class="box border grey">
								         	       <div class="box-title">
									      	      <h4><i class="fa fa-pencil-square"></i>内容</h4>
								        	       </div>
									               <div class="box-body">
										           <textarea  class="ckeditor" name="blogContent" id="editor2">
										           ${blog.blogContent}
										           </textarea>
									              </div>
								                </div>
							                     	<!-- /CKE -->
												   <div class="form-group">
													<label class="col-md-1 control-label">背景图片</label>
													<div class="col-sm-7">
													<input type="text" id="blogBackPic" value="${blog.blogBackPic}" name="blogBackPic" class="form-control" placeholder="请选择或输入URL">
													</div>
												      <button   id="findpic" onclick="findPic();" type="button" class="btn btn-warning ">  
												                从本文选择图片    
												      </button>
											      
												  </div>
												  <div class="box border grey" id="ulid">
						                         
											       </div>
												  
										          <div class="form-group">
													<label class="col-md-5 control-label"></label>
													<div class="col-sm-7">
													<button class="btn btn-primary bnt-xs" type="submit">
													<i class="fa fa-pencil-square-o"></i> 提交内容
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
	<!-- CKEDITOR -->
	<script type="text/javascript" src="js/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="js/add/blogadd.js"></script>
	
</body>

	
</html>
