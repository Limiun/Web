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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- STYLESHEETS -->
<!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/css/cloud-admin.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/css/themes/default.css"/>"
	id="skin-switcher">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/css/responsive.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/font-awesome/css/font-awesome.min.css"/>">
<!-- JQUERY UI-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/js/jquery-ui-1.10.3.custom/css/custom-theme/jquery-ui-1.10.3.custom.min.css"/>">
<!-- DATE RANGE PICKER -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/js/bootstrap-daterangepicker/daterangepicker-bs3.css"/>">
<!-- DATA TABLES -->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/js/datatables/media/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/js/datatables/media/assets/css/datatables.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/js/datatables/extras/TableTools/media/css/TableTools.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/manager/css/zTreeStyle.css"/>">
<!-- JQUERY -->
<script src="<c:url value="/manager/js/jquery/jquery-2.0.3.min.js"/>"></script>
<script src="<c:url value="/manager/js/jquery/jquery.ztree.core.js"/>"></script>
<script
	src="<c:url value="/manager/js/jquery/jquery.ztree.excheck.js"/>"></script>
<!-- JQUERY UI-->
<script
	src="<c:url value="/manager/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"/>"></script>

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
							<div class="description">已读通知被标记：--</div>
						</div>
					</div>
				</div>
				<!-- /PAGE HEADER -->
				<div class="row">
					<div class="col-md-12">
						<!-- BOX -->
						<div class="box border green">
							<div class="box-title">
								<h4>
									<i class="fa fa-bars"></i>已发公告
								</h4>
								<div class="tools">
									<a href="#box-config" data-toggle="modal" class="config"> <i
										class="fa fa-cog"></i>
									</a> <a href="javascript:;" class="reload"> <i
										class="fa fa-refresh"></i>
									</a> <a href="javascript:;" class="collapse"> <i
										class="fa fa-chevron-up"></i>
									</a> <a href="javascript:;" class="remove"> <i
										class="fa fa-times"></i>
									</a>
								</div>
							</div>
							<div class="box-body">

								<div class="panel-group" id="accordion">
								
								<c:forEach items="${List}" var="list" varStatus="status">
											<div class="panel panel-default">
											
											<div class="panel-heading">
											
												<h3 class="panel-title">
													<a class="accordion-toggle" data-toggle="collapse"
														data-parent="#accordion" href="#${list.id}">
														 <c:if test="${list.noticeState=='0'}">
															<button type="button" class="btn btn-warning btn-xs">
																标题：【${list.noticeTitle}】
															</button>
											             </c:if> 
											              <c:if test="${list.noticeState=='1'}">
											                 <button type="button" class="btn btn-default btn-xs">
																标题：<del>【${list.noticeTitle}】</del>
															</button>
											              </c:if> 
													</a>
												</h3>
											     
											</div>
											  
											
											<div id="${list.id}" class="panel-collapse collapse">
												<div class="panel-body">
													<blockquote>
														<p>${list.noticeContent}</p>
														<footer>
															发布时间 <cite title="Source Title">${list.noticeDate}</cite>
														</footer>
													</blockquote>
													<a id="deleterole"
														onclick="javascript:return  sureDelete()"
														href="${pageContext.request.contextPath}/NoticeServlet?notice=userdelete&id=${list.id}">
														<button type="button" class="btn btn-danger btn-xs">
															删除本条</button>
													</a>
											      <c:if test="${list.noticeState=='0'}">
												    <a href="${pageContext.request.contextPath}/NoticeServlet?notice=update&id=${list.id}">
														<button type="button" class="btn btn-warning btn-xs">
															标记已读
														</button>
											         </a>
											     </c:if>
													<hr/>

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
			</div>
			<!-- /CONTENT-->
		</div>
	</div>
	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->


	<!-- BOOTSTRAP -->
	<script
		src="<c:url value="/manager/bootstrap-dist/js/bootstrap.min.js"/>"></script>
	<!-- DATE RANGE PICKER -->
	<script
		src="<c:url value="/manager/js/bootstrap-daterangepicker/moment.min.js"/>"></script>
	<script
		src="<c:url value="/manager/js/bootstrap-daterangepicker/daterangepicker.min.js"/>"></script>
	<!-- SLIMSCROLL -->
	<script
		src="<c:url value="/manager/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"/>"></script>
	<script
		src="<c:url value="/manager/js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"/>"></script>
	<!-- BLOCK UI -->
	<script
		src="<c:url value="/manager/js/jQuery-BlockUI/jquery.blockUI.min.js"/>"></script>
	<!-- DATA TABLES -->
	<script
		src="<c:url value="/manager/js/datatables/media/js/jquery.dataTables.min.js"/>"></script>
	<script
		src="<c:url value="/manager/js/datatables/media/assets/js/datatables.min.js"/>"></script>
	<script
		src="<c:url value="/manager/js/datatables/extras/TableTools/media/js/TableTools.min.js"/>"></script>
	<script
		src="<c:url value="/manager/js/datatables/extras/TableTools/media/js/ZeroClipboard.min.js"/>"></script>
	<!-- COOKIE -->
	<script
		src="<c:url value="/manager/js/jQuery-Cookie/jquery.cookie.min.js"/>"></script>
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