<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta charset="utf-8">
        <!-- Description, Keywords and Author -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>挚友社区</title>
		<link rel="shortcut icon" href="../yorbest/images/favicon.ico" type="image/x-icon">
        <!-- style -->
        <link href="../yorbest/css/style.css" rel="stylesheet" type="text/css">
        <!-- style -->
        <!-- bootstrap -->
        <link href="../yorbest/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <!-- responsive -->
        <link href="../yorbest/css/responsive.css" rel="stylesheet" type="text/css">
        <!-- font-awesome -->
        <link href="../yorbest/css/fonts.css" rel="stylesheet" type="text/css">
        <link href="../yorbest/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- font-awesome -->
        <link href="../yorbest/css/effects/normalize.css" rel="stylesheet" type="text/css">
        <link href="../yorbest/css/effects/component.css"  rel="stylesheet" type="text/css" >
	</head>
  
  <body>
  
  <!-- header -->
        	<header role="header">
            	<div class="container">
                	<!-- logo -->
                    	
                    <!-- logo -->
                    <!-- nav -->
                    <nav role="header-nav" class="navy">
                        <ul>
                            <li class="nav-active"><a href="${pageContext.request.contextPath}/MoodServlet?mood=all" title="Mood">Mood</a></li>
                            <li><a href="${pageContext.request.contextPath}/BlogServlet?blog=all" title="Blog">Blog</a></li>
                           
                        </ul>
                    </nav>
                    <!-- nav -->
                </div>
            </header>
        <!-- header -->
        <!-- main -->
        <main role="main-inner-wrapper" class="container">
            	<div class="blog-details">
                	<article class="	" id="post-details">
                        <header role="bog-header" class="bog-header text-center">
                            <h3><span>${mood.moodTitle}</span></h3>
                              <h4>${mood.moodDate}</h4>
                              <h5>${mood.moodId}&nbsp;&nbsp;&nbsp;${mood.mooduserName}</h5>
                        </header>
                        <div class="enter-content">
                           ${mood.moodContent}
                        </div>
                	</article>
                </div>
        </main>
    	<!-- main -->
        <!-- footer -->
        <footer role="footer">
            <!-- logo -->
                
            <!-- logo -->
            <!-- nav -->
            <nav role="footer-nav">
            	<ul>
                    <li><a  href="${pageContext.request.contextPath}/MoodServlet?mood=all" title="Mood">Mood</a></li>
                </ul>
            </nav>
            <!-- nav -->
            <ul role="social-icons">
            	<!-- <li><a href="https://twitter.com/yorbesta" target="_blank"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                <li><a href="https://www.facebook.com/best.yor?ref=bookmarks" target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                  <li><a href="https://vk.com/bonsacchic" target="_blank"><i class="fa fa-vk" aria-hidden="true"></i></a></li> -->
               <li><a href="${pageContext.request.contextPath}/PreFormServlet" target="_blank"><i class="fa fa-arrows-alt" aria-hidden="true"></i></a></li>
            </ul>
            <p class="copy-right">&copy; Best Friends Community.</p>
        </footer>

        <!-- footer -->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <!-- custom -->
		<script src="js/nav.js" type="text/javascript"></script>
        <script src="js/custom.js" type="text/javascript"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script src="js/effects/masonry.pkgd.min.js"  type="text/javascript"></script>
		<script src="js/effects/imagesloaded.js"  type="text/javascript"></script>
		<script src="js/effects/classie.js"  type="text/javascript"></script>
		<script src="js/effects/AnimOnScroll.js"  type="text/javascript"></script>
        <script src="js/effects/modernizr.custom.js"></script>
        <!-- jquery.countdown -->
        <script src="js/html5shiv.js" type="text/javascript"></script>

    </body>
    









  </body>
</html>
