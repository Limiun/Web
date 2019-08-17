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
	<title>Admin</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
    <link rel="stylesheet" type="text/css" href="<c:url value="/manager/css/cloud-admin.css"/>" >
	<!-- UNIFORM -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/manager/js/uniform/css/uniform.default.min.css"/>" >
	<link rel="stylesheet" href="<c:url value="/manager/font-awesome/css/font-awesome.min.css"/>" >
	<!-- ANIMATE:控制渐变  -->
	<link rel="stylesheet" type="text/css" href="<c:url value="/manager/css/animatecss/animate.min.css" />" >
	<!-- JQUERY -->
	<script src="<c:url value="/manager/js/jquery/jquery-2.0.3.min.js"/>"></script>
	<!-- 校验表单 -->
	<script type="text/javascript" src="<c:url value="/manager/js/jquery-validate/jquery.validate.min.js"/>"></script>
	<!-- 登录校验 -->
	<script type="text/javascript" src="<c:url value="/manager/js/add/login.js"/>"></script>
	  
    
</head>
<body class="login">	

	<!-- PAGE -->
	<section id="page">
			<!-- HEADER -->
			<header>
				<!-- NAV-BAR -->
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<%-- <div id="logo">
								<a href="#"><img src="<c:url value="/manager/img/logo/logo.png"/>" height="40" alt="logo name" /></a>
							</div> --%>
						</div>
					</div>
				</div>
				<!--/NAV-BAR -->
			</header>
			<!--/HEADER -->
			<!-- LOGIN -->
			<section id="login_bg" class="visible">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div class="login-box">
								<h2 class="bigintro">系统登录</h2>
								<div class="divide-30"></div>
								<form role="form"  id="loginForm" action="${pageContext.request.contextPath}/LoginServlet">
								<input type="hidden" name="token"  id="token1" value="${token}"/>
								  <div class="form-group">
									<label for="userEmail">邮箱</label>
									<i class="fa fa-envelope"></i>
									<input type="email" class="form-control" id="userEmail1" name="userEmail">
								  </div>
								  <div class="form-group"> 
									<label for="loginPass">密码</label>
									<i class="fa fa-lock"></i>
									<input type="password" class="form-control" id="userPassWord1" name="userPassWord">
								  </div>
								  <div>
									<button type="button" class="btn btn-danger" onclick="return checkEmailPass();" >提交</button>
								  </div>
								</form>
								
								<div class="login-helpers">
									
									还没有帐号? <a href="#" onclick="swapScreen('register_bg');return false;">注册 !</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--/LOGIN -->
			<!-- REGISTER -->
			<section id="register_bg" class="font-400">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div class="login-box">
								<h2 class="bigintro">注册</h2>
								<div class="divide-40"></div>
								<form role="form" id="regForm" action="${pageContext.request.contextPath}/RegisterServlet">
                                  <input type="hidden" name="token" value="${token}"/>
								  <div class="form-group">
									<label for="userName">姓名</label>
									<i class="fa fa-font"></i>
									<input type="text" class="form-control" id="userName" name="userName" >
									<input type="hidden" class="form-control" value="NULL" id="userPic" name="userPic" >
								  </div>
								  <div class="form-group">
									<label for="userNickName">昵称</label>
									<i class="fa fa-user"></i>
									<input type="text" class="form-control" id="userNickName" name="userNickName">
								  </div>
								  <div class="form-group">
									<label for="userEmail">邮箱</label>
									<i class="fa fa-envelope"></i>
									<input type="email" class="form-control" id="userEmail" name="userEmail"  onblur="return checkEmail();">
								  </div>
								  <div class="form-group"> 
									<label for="userPassWord">密码</label>
									<i class="fa fa-lock"></i>
									<input type="password" class="form-control" id="userPassWord" name="userPassWord" >
								  </div>
								  <div class="form-group"> 
									<label for="regRePass">密码确认</label>
									<i class="fa fa-check-square-o"></i>
									<input type="password" class="form-control" id="regRePass" name="regRePass" >
								  </div>
								  <div>
									<button type="submit"  id="regSubmit" class="btn btn-success" >注册</button>
								  </div>
								</form>
								<div class="login-helpers">
									<a href="#" onclick="swapScreen('login_bg');return false;"> 返回</a> <br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!--/REGISTER -->
			<!-- FORGOT PASSWORD -->
			<section id="forgot_bg">
				<div class="container">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<div class="login-box">
								<h2 class="bigintro">重设密码</h2>
								<div class="divide-40"></div>
								<form role="passForm" id="passForm">
								  <div class="form-group">
									<label for="userEmail">填写注册的邮箱</label>
									<i class="fa fa-envelope"></i>
									<input type="email" class="form-control" id="userEmail2"  name="userEmail">
								  </div>
								  <div>
									<button type="submit" class="btn btn-info">发送密码邮件</button>
								  </div>
								</form>
								<div class="login-helpers">
									<a href="#" onclick="swapScreen('login_bg');return false;">返回</a> <br>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- FORGOT PASSWORD -->
	</section>
	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- BOOTSTRAP -->
	<script src="<c:url value="/manager/bootstrap-dist/js/bootstrap.min.js"/>"></script>	
	<!-- JQUERY UI:是建立在 jQuery JavaScript 库上的一组用户界面交互、特效、小部件及主题。-->
	<script src="<c:url value="/manager/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"/>"></script>
	<script src="<c:url value="/manager/js/jQuery-Cookie/jquery.cookie.min.js"/>"></script>
	<!-- UNIFORM:是一个jQuery插件可以控制表单中各种控件的外观（CheckBoxe、下拉菜单、Radio按纽和文件上传选择框） -->
	<script type="text/javascript" src="<c:url value="/manager/js/uniform/jquery.uniform.min.js"/>"></script>
	<!-- BACKSTRETCH:主要用于设置页面背景图片，也可以设置html元素的背景图片。背景图片可以设置多张，在间隔时间内循环显示。 -->
	<script type="text/javascript" src="<c:url value="/manager/js/backstretch/jquery.backstretch.min.js"/>"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="<c:url value="/manager/js/script.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/manager/js/add/login2.js"/>"></script>
	<!-- <script>
		jQuery(document).ready(function() {		
			App.setPage("login_bg");  //Set current page
			App.init(); //Initialise plugins and elements
		});
	</script>
	<script type="text/javascript">
		function swapScreen(id) {
			jQuery('.visible').removeClass('visible animated fadeInUp');
			jQuery('#'+id).addClass('visible animated fadeInUp');
		}
	</script> -->
	
	
		<!-- /JAVASCRIPTS -->
</body>
</html>