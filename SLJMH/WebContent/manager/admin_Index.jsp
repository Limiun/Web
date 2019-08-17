<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<title> Admin | 控制台</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<link rel="stylesheet" type="text/css"  href="css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="css/themes/default.css" id="skin-switcher" >
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
  <div>
  </div>
	<!-- HEADER -->
	<header class="navbar clearfix" id="header">
		<div class="container">
				<div class="navbar-brand">
					<!-- LOGO -->
					<a href="#"  target="_black">
						<img src="img/logo/logo.png" class="img-responsive" height="30" width="110">
					</a>
					<!-- / LOGO -->
					<!-- 侧边栏折叠 -->
					<div id="sidebar-collapse" class="sidebar-collapse btn">
						<i class="fa fa-bars" 
							data-icon1="fa fa-bars" 
							data-icon2="fa fa-bars" ></i>
					</div>
					<!-- /侧边栏折叠 -->
				</div>
				<!-- 导航栏的左  -->
				<ul class="nav navbar-nav pull-left hidden-xs" id="navbar-left">
					
				</ul>
				<!-- /导航栏的左 -->
				<!-- 开始顶部导航菜单 -->					
				<ul class="nav navbar-nav pull-right">
					<!-- 开始通知下拉 -->	
					<c:if test="${fn:length(noList)>0}">
					<li class="dropdown" id="header-notification">
						
					</li>
					 </c:if> 
					
					<!-- 任务进度 -->
					<!-- 开始用户登录下拉菜单 -->
					<li class="dropdown user" id="header-user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img alt="" src="<c:url value="${user.userPic}"/>" />
							<span class="username">${user.userName}</span>
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#box-config"  data-toggle="modal">
							<i class="fa fa-user"></i> 个人信息</a>
							</li>
							<li><a href="<%=basePath%>LoginServlet?set=reset">
							<i class="fa fa-power-off"></i> 注销</a></li>
						</ul>
					</li>
					<!-- 结束用户登录下拉菜单 -->
				</ul>
				<!-- 开始顶部导航菜单 -->
		</div>
	</header>
	<!--/HEADER -->
		<!-- PAGE -->
		  	<!-- SAMPLE BOX CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="box-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
				  <div class="modal-content">
					<div class="modal-header">
					  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					  <h4 class="modal-title">修改个人信息</h4>
					</div>

				<form id="userUpdateForm" action="${pageContext.request.contextPath}/UserServlet?user=update&toJsp=index" method="post">
					<div class="modal-body">

						<div class="form-group">
							<input type="hidden" name= "userId" class="form-control" id="userId" value="${user.userId}">
						</div>
						<div class="form-group">
							 <input type="hidden"
								class="form-control" name="userName" id="userName"  value="${user.userName}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">用户昵称</label> <input type="text"
								class="form-control" id="userNickName" name="userNickName"  value="${user.userNickName}">
						</div>

						<div class="form-group">
							 <input type="hidden"
								class="form-control" name="userEmail" id="userEmail"  value="${user.userEmail}">
						</div>
                        <div class="form-group">
							<label for="exampleInputEmail1">密码</label> <input type="text"
								class="form-control" name="userPassWord" id="userPassWord"  value="${user.userPassWord}">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">身份证号</label> <input type="text"
								class="form-control" name="userIdentify" id="userIdentify"  value="${user.userIdentify}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">真名</label> <input type="text"
								class="form-control" name="userTrueName" id="userTrueName"  value="${user.userTrueName}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">生日</label> <input type="text"
								class="form-control" name="userBirthday" id="userBirthday"  value="${user.userBirthday}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">性别</label> <br/>
							<label><input name="userSex"  type="radio" value="M" />男 </label> 
							<label><input name="userSex" type="radio" value="F" checked="checked"/>女 </label>	
							<%-- <input type="text"
								class="form-control" name="userSex" id="userSex"  value="${user.userSex}"> --%>
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">星座</label> <input type="text"
								class="form-control" name="userStar" id="userStar"  value="${user.userStar}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">血型</label> <input type="text"
								class="form-control" name="userBlood" id="userBlood"  value="${user.userBlood}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">性格</label> <input type="text"
								class="form-control" name="userCharacter" id="userCharacter"  value="${user.userCharacter}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">爱好</label> <input type="text"
								class="form-control" name="userHobby" id="userHobby"  value="${user.userHobby}">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">职业</label> <input type="text"
								class="form-control" name="userJob" id="userJob"  value="${user.userJob}">
						</div>
						
						

						<div class="panel panel-default">
							<!-- Default panel contents -->
							<div class="panel-heading">头像</div>
							<div class="panel-body">
								<div class="row fontawesome-icon-list">
										<div class="fa-hover col-md-12 col-sm-4">
											<img alt="1" src="img/avatars/avatar1.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar1.jpg"> 
											<img alt="2" src="img/avatars/avatar2.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar2.jpg">
											<img alt="3" src="img/avatars/avatar3.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar3.jpg">
											<img alt="4" src="img/avatars/avatar4.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar4.jpg">
											<img alt="5" src="img/avatars/avatar5.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar5.jpg">
											<img alt="6" src="img/avatars/avatar6.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar6.jpg">
											<img alt="7" src="img/avatars/avatar7.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar7.jpg">
											<img alt="8" src="img/avatars/avatar8.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar8.jpg">
											<img alt="9" src="img/avatars/avatar9.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar9.jpg">
											<img alt="10" src="img/avatars/avatar10.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar10.jpg">
											<img alt="11" src="img/avatars/avatar11.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar11.jpg">
											<img alt="12" src="img/avatars/avatar12.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar12.jpg">
										    <img alt="13" src="img/avatars/avatar13.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar13.jpg">
											<img alt="14" src="img/avatars/avatar14.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar14.jpg">
											<img alt="15" src="img/avatars/avatar15.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar15.jpg">
									        <img alt="16" src="img/avatars/avatar16.jpg" />
											<input type="radio" name="userPic" id="userPic" value="img/avatars/avatar16.jpg">
										</div>
								</div>
							</div>
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
	<section id="page">
				<!-- SIDEBAR -->
				<div id="sidebar" class="sidebar">
					<div class="sidebar-menu nav-collapse" id="continer">
						<div class="divide-20"></div>
						<!-- SEARCH BAR -->
						<div id="search-bar">
							<input class="search" type="text" placeholder="Search"><i class="fa fa-search search-icon"></i>
						</div>
						<!-- /SEARCH BAR -->
						
						<!-- SIDEBAR QUICK-LAUNCH -->
						<!-- <div id="quicklaunch">
						<!-- /SIDEBAR QUICK-LAUNCH -->
						
						<!-- SIDEBAR MENU -->
						
<ul>

					
<c:forEach items="${userMenuList}" var="menu" varStatus="status">
<!-- 一级子菜单没有子菜单:有URL-->
  <c:if test="${menu.menuFather==1 and empty menu.childMenus and not empty menu.menuUrl}">
        <li>
             <a href="<%=basePath%><c:url value='${menu.menuUrl}'/>" title="${menu.menuName}"  target="main_Frame">
             <i class="fa ${menu.menuPic} fa-fw"></i> 
             <span class="menu-text">${menu.menuName}</span>
             </a>
          
        </li>
  </c:if>

 <!-- 可展开的一级菜单(没有URL),有子菜单-->
   <c:if test="${menu.menuFather==1 and not empty menu.childMenus and  empty menu.menuUrl}">
        <li  class="has-sub">
            <a href="javascript:;" class="">
                <i class="fa ${menu.menuPic} fa-fw"></i>
                <span class="menu-text">${menu.menuName}</span>
                <span class="arrow"></span>
            </a>

            <ul class="sub">
                <!-- 无三级菜单：没有子菜单，有URL -->
                <c:forEach items="${menu.childMenus}" var="secondChild" varStatus="status">
                    <c:if test="${empty secondChild.childMenus and  not empty secondChild.menuUrl}">
                        <li>
                          <a class=""  href="<%=basePath%><c:url value='${secondChild.menuUrl}'/>" target="main_Frame">
                          <span class="sub-menu-text">${secondChild.menuName}
                          </span>
                          </a>
                        </li>
                    </c:if>
                 <!-- 有三级菜单 :有子菜单，没有URL-->
                    <c:if test="${not empty secondChild.childMenus and empty secondChild.menuUrl}">
                        <li class="has-sub-sub">
                                 <a href="javascript:;" class=""><span class="sub-menu-text">${secondChild.menuName}</span>
                                 <span class="arrow"></span>
                                 </a>
                                 <ul class="sub-sub">
                                        <c:forEach items="${secondChild.childMenus}" var="thirdChild" varStatus="status">
                                        <li>
                                           <a class="" href="<%=basePath%><c:url value='${thirdChild.menuUrl}'/>" target="main_Frame">
                                           <span class="sub-sub-menu-text">${thirdChild.menuName}
                                           </span></a>
                                       </li>
                                      </c:forEach>
                                 </ul>
                              </li>
                    </c:if>
                </c:forEach>
            </ul>
        </li>
    </c:if> 
</c:forEach>
		</ul>				
		<!-- /SIDEBAR MENU -->
					</div>
					
				</div>
				<!-- /SIDEBAR -->
				<!--这里说一下一定要将div环绕iframe -->
			    <div id="main-content">
				<iframe id="main_Frame"  frameborder="0"  height="950" width="100%" name="main_Frame" src="admin_Index_Main.jsp"> </iframe>	
               </div> 
	</section>
	<!--/PAGE -->
	
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="js/jquery/jquery-2.0.3.min.js"></script>
	<!-- JQUERY UI-->
	<script src="js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="bootstrap-dist/js/bootstrap.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="text/javascript" src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script><script type="text/javascript" src="js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- COOKIE -->
	<script type="text/javascript" src="js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="js/script.js"></script>
	 <script src="js/add/admin_index.js"></script>

	
	<!-- /JAVASCRIPTS -->
</body>
</html>