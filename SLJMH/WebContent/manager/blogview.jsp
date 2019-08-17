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
    
    
    
    
</head>
<body>
	<!-- PAGE -->
			<button onclick="comment(this)"></button>
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
					<!-- PAGE HEADER-->
						<div class="row">
							<div class="col-sm-12">
								<div class="page-header">
									<div class="clearfix">
										<h3 class="content-title pull-left">博客管理</h3>
									</div>
									<div class="description">这里写点啥？</div>
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
										<h4><i class="fa fa-sitemap"></i>博客列表</h4>
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
												    <th class="center">博客ID</th>
												    <th class="center">博客用户</th>
												    <th class="center">博客时间</th>
													<th class="center">博客标题</th>
													<th class="center">博客Tag</th>
													<th class="center">附件内容</th>
													<th class="center">操作</th>
												</tr>
											</thead>
											<tbody>
											<c:forEach items="${blogList}" var="blog" varStatus="status">
												<c:choose >
												<c:when test="${user.userName=='张学友'}">
													<tr class="gradeX" >
													<td>${blog.blogId}</td>
													<td>${blog.bloguserName}</td>
													<td>${blog.blogDate}</td>
													<td>${blog.blogTitle}</td>
													<td>${blog.blogTag}</td>
													<td><img src="${blog.blogBackPic}">	</td>
													<td class="center">
													  <%-- <a  href="${pageContext.request.contextPath}/BlogServlet?blog=update&flag=flag&blogId=${blog.blogId}">
												      <button type="button" class="btn btn-warning btn-xs">修改</button>
											         </a>
													 <a id="deleteblog" onclick="javascript:return  sureDelete()" href="${pageContext.request.contextPath}/BlogServlet?blog=delete&blogId=${blog.blogId}">
													 <button type="button" class="btn btn-danger btn-xs">
											                         删除</button>
											          </a>
													  --%>
													</td>
												</tr>
												</c:when>
												<c:when test="${user.userName=='薛增博'}">
												<tr class="gradeX" >
													<td>${blog.blogId}</td>
													<td>${blog.bloguserName}</td>
													<td>${blog.blogDate}</td>
													<td>${blog.blogTitle}</td>
													<td>${blog.blogTag}</td>
													<td><img src="${blog.blogBackPic}">	</td>
													<td class="center">
													 <%--  <a  href="${pageContext.request.contextPath}/BlogServlet?blog=update&flag=flag&blogId=${blog.blogId}">
												      <button type="button" class="btn btn-warning btn-xs">修改</button>
											         </a>
													 <a id="deleteblog" onclick="javascript:return  sureDelete()" href="${pageContext.request.contextPath}/BlogServlet?blog=delete&blogId=${blog.blogId}">
													 <button type="button" class="btn btn-danger btn-xs">
											                         删除</button>
											          </a> --%>
													 
													</td>
												</tr>
												</c:when>
												<c:otherwise>
												    <c:if test="${blog.bloguserName==user.userName}">
												    <tr class="gradeX" >
													<td>${blog.blogId}</td>
													<td>${blog.bloguserName}</td>
													<td>${blog.blogDate}</td>
													<td>${blog.blogTitle}</td>
													<td>${blog.blogTag}</td>
													<td><img src="${blog.blogBackPic}">	</td>
													<td class="center">
													  <a  href="${pageContext.request.contextPath}/BlogServlet?blog=update&flag=flag&blogId=${blog.blogId}">
												      <button type="button" class="btn btn-warning btn-xs">修改</button>
											         </a>
													 <a id="deleteblog" onclick="javascript:return  sureDelete()" href="${pageContext.request.contextPath}/BlogServlet?blog=delete&blogId=${blog.blogId}">
													 		<button type="button" class="btn btn-danger btn-xs">
											                         删除</button>
											          </a>
													 
													</td>
												</tr>
												    
												    </c:if>
												
												
												</c:otherwise>
												</c:choose>
											<!--  	<tr class="gradeX" >
													<td>${blog.blogId}</td>
													<td>${blog.bloguserName}</td>
													<td>${blog.blogDate}</td>
													<td>${blog.blogTitle}</td>
													<td>${blog.blogTag}</td>
													<td class="center">
													  <a  href="${pageContext.request.contextPath}/BlogServlet?blog=update&flag=flag&blogId=${blog.blogId}">
												      <button type="button" class="btn btn-warning btn-xs">修改</button>
											         </a>
													 <a id="deleteblog" onclick="javascript:return  sureDelete()" href="${pageContext.request.contextPath}/BlogServlet?blog=delete&blogId=${blog.blogId}">
													 <button type="button" class="btn btn-danger btn-xs">
											                         删除</button>
											          </a>
													 
													</td>
												</tr>  -->
										  </c:forEach>
											</tbody>
											<tfoot>
												<tr>
													<th></th>
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
		<script type="text/javascript" src="<c:url value="/manager/js/add/blogview.js"/>"></script>
	
	<!-- /JAVASCRIPTS -->
</body>
</body>
	<!-- 加载Layui的配置 -->
<script src="layui/layui.all.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
    $(function(){
  $("#list").load("{pageContext.request.contextPath}/usercomment/comment.do?contentId="+${blog.blogId});
 });
 
</html>