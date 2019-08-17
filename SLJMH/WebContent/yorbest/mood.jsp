
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE HTML>
 <html lang="en">
<head>
    	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta charset="utf-8">
        <!-- Description, Keywords and Author -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>朋友圈</title>
		<link rel="shortcut icon" href="./yorbest/images/favicon.ico" type="image/x-icon">
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
                            <li><a href="${pageContext.request.contextPath}/BlogServlet?blog=all" title="Blog">Blog</a></li>
                            <li class="nav-active"><a href="${pageContext.request.contextPath}/MoodServlet?mood=all" title="Mood">Mood</a></li>
                        </ul>
                    </nav>
                    <!-- nav -->
                </div>
            </header>
        <!-- header -->
        <!-- main -->
        <main role="main-inner-wrapper" class="container">
            <div class="row">
            	<div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 ">
                	<article role="pge-title-content" class="blog-header">
                    	<header>
                        	<h2><span>Community</span> Best Friends </h2>
                        </header>
                        <p>Get all information about our studio from latest news posts & updates page.</p>
                    </article>
                    <ul class="grid-lod effect-2" id="grid">
                    <c:forEach items="${moodList}" var="mood" varStatus="status" begin="1"  end="29"   step="2">
                        <li>
                        <a href="${pageContext.request.contextPath}/MoodServlet?mood=detail&moodId=${mood.moodId}">
                        	<section class="blog-content">                       	
                                <figure>
                                    <div class="post-date">
                                        <span>${mood.moodId}</span>  
                                    </div>
                                    </figure>
                                    
                                     <a href="${pageContext.request.contextPath}/MoodServlet?mood=detail&moodId=${mood.moodId}">                               
                                    <article>
                                   ${mood.moodTitle}
                                    </article>
                                    </a>
                    </section>
                            </a>
                        </li>
                       </c:forEach>
                    </ul>

                </div>

                

                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                	<ul class="grid-lod effect-2" id="grid">
                	   <c:forEach items="${moodList}" var="mood" varStatus="status" begin="0"  end="30"   step="2">
                        <li>
                        
                    		<section class="blog-content">                       	
                               <figure>
                                    <div class="post-date">
                                        <span> ${mood.moodId}</span>
                                    </div>                            
                                </figure>
                                 <a href="${pageContext.request.contextPath}/MoodServlet?mood=detail&moodId=${mood.moodId}">
                                <article>
                                    ${mood.moodTitle}
                                </article>
                                </a>
                            </section>
                            
                    	</li>
                    	  </c:forEach>
                    </ul>
                </div>

                

                

                

               

                

                

            </div>
        </main>

    	<!-- main -->
        <!-- footer -->
        <footer role="footer">
            <!-- logo -->
                <h1>
                    <a href="${pageContext.request.contextPath}/WebSiteServlet?yor=yor" title="YorbestFriend"><img src="images/logo.png" title="Yorbest" alt="Yorbest"/></a>
                </h1>
            <!-- logo -->
            <!-- nav -->
            <nav role="footer-nav">
            	<ul>
                    <li><a href="${pageContext.request.contextPath}/BlogServlet?blog=all" title="Blog">Blog</a></li>
                    <li><a href="${pageContext.request.contextPath}/MoodServlet?mood=all" title="Mood">Mood</a></li>
                </ul>
            </nav>
            <!-- nav -->
            <ul role="social-icons">
            	<li><a href="https://twitter.com/yorbesta" target="_blank"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
 <li><a href="https://www.facebook.com/best.yor?ref=bookmarks" target="_blank"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                 <li><a href="https://vk.com/bonsacchic" target="blank"><i class="fa fa-vk" aria-hidden="true"></i></a></li>
                <li><a href="${pageContext.request.contextPath}/PreFormServlet" target="blank"><i class="fa fa-arrows-alt" aria-hidden="true"></i></a></li>
            </ul>
            <p class="copy-right">&copy; 2019 挚友社区.</p>
        </footer>

        <!-- footer -->
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <!-- custom -->
		<script src="../yorbest/js/nav.js" type="text/javascript"></script>
        <script src="../yorbest/js/custom.js" type="text/javascript"></script>
        <!-- Include ../yorbest/all compiled plugins (below), or include individual files as needed -->
        <script src="../yorbest/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../yorbest/js/effects/masonry.pkgd.min.js"  type="text/javascript"></script>
		<script src="../yorbest/js/effects/imagesloaded.js"  type="text/javascript"></script>
		<script src="../yorbest/js/effects/classie.js"  type="text/javascript"></script>
		<script src="../yorbest/js/effects/AnimOnScroll.js"  type="text/javascript"></script>
        <script src="../yorbest/js/effects/modernizr.custom.js"></script>
        <!-- jquery.countdown -->
        <script src="../yorbest/js/html5shiv.js" type="text/javascript"></script>

    </body>
</html>