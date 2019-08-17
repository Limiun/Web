<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE HTML>
 <html>
    <head>
    	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
        <meta charset="utf-8">
        <!-- Description, Keywords and Author -->
        <meta name="description" content="">
        <meta name="author" content="">
        <title>挚友社区</title>
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <!-- style -->
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <!-- style -->
        <!-- bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <!-- responsive -->
        <link href="css/responsive.css" rel="stylesheet" type="text/css">
        <!-- font-awesome -->
        <link href="css/fonts.css" rel="stylesheet" type="text/css">
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- font-awesome -->
        <link href="css/effects/normalize.css" rel="stylesheet" type="text/css">
        <link href="css/effects/component.css"  rel="stylesheet" type="text/css" >
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
        
        <!-- ******* -->
        <link rel="stylesheet" href="layui/css/layui.css"/>
  
   
        
	</head>
    <body>
    	<!-- header -->
        	<header role="header">
            	<div class="container">
                	<!-- logo -->
                    	<h1>
                        	<a href="${pageContext.request.contextPath}/WebSiteServlet?yor=yor" title="Yorbest">
                        	<img src="../yorbest/images/logo.png" title="Yorbest" alt="Yorbest"/></a>
                        </h1>
                    <!-- logo -->
                    <!-- nav -->
                    <nav role="header-nav" class="navy">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/WebSiteServlet?yor=yor" title="Home">Home</a></li>
                            <li><a href="about.jsp" title="About">About</a></li>
                            <li class="nav-active"><a href="${pageContext.request.contextPath}/BlogServlet?blog=all" title="Blog">Blog</a></li>
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
                            <h3>
                            <span>${blog.blogTitle}</span></h3>
                              
                              
                              <h4>${blog.blogDate}</h4>
                        </header>
                        <div class="enter-content">
                           ${blog.blogContent}
                        </div>
                	</article>
                </div>
                	<form class="layui-form" id="myform" name="myform" action="${pageContext.request.contextPath}/usercomment/addcomment.do" method="post"  style="width:80%;">
						<input name="c_userid" value="${user.userId }" hidden="hidden"/>
						<input name="c_username" value="${user.userName}" hidden="hidden"/>
						<input name="c_contentid" value="${blog.blogId}" hidden="hidden"/>
						<input name="c_otherid" value="${blog.bloguserId}" hidden="hidden"/>
						<input name="c_othername" value="${blog.bloguserName}" hidden="hidden"/>
						<div class="layui-input-block" style="margin-left: 0;">
       						<textarea id="c_content" name="c_content" placeholder="请输入你的留言" class="layui-textarea" style="height: 150px;"></textarea>
    					</div>
						<br/>
 					    <div class="layui-input-block" style="text-align: left;margin-left: 0;">
     						<input type="submit" class="layui-btn" id="liuyan" value="留言">
   					    </div>
					</form>	
      	 			
      	 								<!-- 留言信息列表展示 -->
						<div>
					    	<ul id="list">
					    	<c:if test="${not empty commentList}">
						        <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
						        <c:forEach items="${commentList}" var="comment" >
									<!-- 如果留言信息是在本文章下的才显示 -->
									<c:if test="${comment.c_contentid eq blog.blogId && comment.c_otherid eq blog.bloguserId}">  
										<li style="border-top: 1px dotted #01AAED">
										<br/>
											<div style="text-align: left;color:#444">
												<div>
													<span style="color:#01AAED">${comment.c_userid}</span>
												</div>
										    	<div>${comment.c_content}</div>
											</div>
											<div class="comment-parent" style="text-align:left;margin-top:7px;color:#444">
										   		<span>${comment.c_createtime}</span>
										   		&nbsp;&nbsp;&nbsp;&nbsp;
										   		<p>
										     		<a href="javascript:;" style="text-decoration: none;" onclick="btnReplyClick(this)">回复</a>
										   		</p>
										   		<hr style="margin-top: 7px;"/>
										   	</div>
										   		 <!-- 回复表单默认隐藏 start-->
						                   <div class="replycontainer layui-hide" style="margin-left: 61px;">
						                        <form action="${pageContext.request.contextPath}/user/addreply" method="post" class="layui-form">
						                            <input name="r_contentid" id="r_contentid" value="${blog.blogId}" hidden="hidden"/>
						                            <input name="r_userid" id="r_userid" value="${user.userId}" hidden="hidden"/>
						                            <input name="r_otherid" id="r_otherid" value="${comment.c_userid}" hidden="hidden"/>
						                            <input name="r_words" id="r_words" value="${comment.c_id}" hidden="hidden"/>
						                            <div class="layui-form-item">
						                                <textarea name="r_content" id="r_content" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
						                            </div>
						                            <div class="layui-form-item">
						                                <button id="replyBtn" class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
						                            </div>
						                         </form>
						                   </div>
										<!-- 以下是回复信息 -->
						                    <c:forEach items="${replyList}" var="reply">
						                        <!-- 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
						                        <c:if test="${reply.r_contentid eq blog.blogId && reply.r_words eq comment.c_id}">
						                            <div style="text-align: left;margin-left:61px;color: #444">
						                                <div>
						                                    <span style="color:#5FB878">${reply.r_userid}&nbsp;&nbsp;回复${reply.r_otherid}</span>
						                                </div>
						                                <div>${reply.r_content}</div>
						                            </div>
						                            <div>
						                                <div class="comment-parent" style="text-align:left;margin-top:7px;margin-left:61px;color:#444">
						                                    <span>${reply.r_creatime}</span>
						                                    &nbsp;&nbsp;&nbsp;&nbsp;
						                                    <p>
						                                        <a href="javascript:;" style="text-decoration: none;" onclick="btnReplyClick(this)">回复</a>
						                                    </p>
						                                    <hr style="margin-top: 7px;"/>
						                                </div>
						                                <!-- 回复表单默认隐藏 -->
						                                <div class="replycontainer layui-hide" style="margin-left: 61px;">
						                                    <form action="${pageContext.request.contextPath}/user/addreply" method="post" class="layui-form">
						                                        <input name="r_contentid" id="r_contentid" value="${blog.blogId}" hidden="hidden"/>
						                                        <input name="r_userid" id="r_userid" value="${user.userId}" hidden="hidden"/>
						                                            <%--  <input name="rCreatime" id="rCreatime" value="<%=nowDate%>" hidden="hidden"/>--%>
						                                        <input name="r_otherid" id="r_otherid" value="${comment.c_userid}" hidden="hidden"/>
						                                        <input name="r_words" id="r_words" value="${comment.c_id}" hidden="hidden"/>
						                                            <%--<input name="rId" id="rId" value="${reply.rId}" hidden="hidden"/>--%>
						                                        <div class="layui-form-item">
						                                            <textarea name="r_content" id="r_content" lay-verify="replyContent" placeholder="请输入回复内容" class="layui-textarea" style="min-height:80px;"></textarea>
						                                        </div>
						                                        <div class="layui-form-item">
						                                            <button id="replyBtn1" class="layui-btn layui-btn-mini" lay-submit="formReply" lay-filter="formReply">提交</button>
						                                        </div>
						                                    </form>
						                                </div>
						
						                            </div>
						                        </c:if>
						                    </c:forEach>
                						</li>
            						</c:if>
        						</c:forEach>
						    </c:if>
						    </ul>
						</div>
      				 
      </main>

    	<!-- main -->
        <!-- footer -->
        <footer role="footer"></footer>

   

    </body>
	<!-- 加载Layui的配置 -->
<script src="layui/layui.all.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
    $(function(){
  $("#list").load("${pageContext.request.contextPath}/usercomment/comment.do?contentId="+${blog.blogId});
 });
</script>
<script type="text/javascript">
    function btnReplyClick(elem) {
        var $ = layui.jquery;
        if($(this)){
        }else if(!$(this)){
            $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-show');
        }
        $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-hide');
        if ($(elem).text() == '回复') {
            $(elem).text('收起')
        } else {
            $(elem).text('回复')
        }
    }
 $("#replyBtn").click(function(){
        var r_contentid = $("#r_contentid1").val();
        var r_userid = $("#r_userid1").val();
        var r_otherid = $("#r_otherid1").val();
        var r_content = $("#r_content1").val();
        var r_words = $("#r_words1").val();
     
        $.ajax({
            url: '${pageContext.request.contextPath}/user/addreply',
            type: 'POST',
            data: [{
                r_contentid: r_contentid,
                r_userid: r_userid,
                r_otherid: r_otherid,
                r_content: r_content,
                r_words: r_words,
                
            }],
            success: function(data){
                layer.open({
                    title: '提示信息',
                    content: '留言成功',
                    btn: ['确定'],
                   /* btn1: function(index){
                      /!*  $("body").html(data);*!/
                    }*/
                });
            },
            error: function(){
                layer.open({
                    title: '提示信息',
                    content: '出现未知错误'
                });
            }
        });
    });

</script>


</html>