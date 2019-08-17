<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
 
    
    <title>My JSP 'addalbum.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style>
		.choose_radio{
			display:block;
			float:left;
			width:20px;
			height:20px;
			border:1px solid #ccc;
			border-radius:2px;
		}
		.choose_radioed{
			display:block;
			float:left;
			width:22px;
			height:22px;
			border-radius:2px;
			background:url(fang_choose.png) no-repeat;
			background-size:100%;
		}
		p{
			float:left;
			margin:0;
		}
		</style>


  </head>
  
  <body>
  
  
  
  <!-- FORMS -->
						<div class="row">
							<div class="col-md-12">
								<!-- SAMPLE -->
								<div class="row">
									<div class="col-md-12">
										<!-- BOX -->
										<div class="box border red">
											<div class="box-title">
												<h4><i class="fa fa-bars"></i>编辑相册</h4>
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
											  <c:if test="${empty album}">
												<form class="form-horizontal" action="${pageContext.request.contextPath}/AlbumServlet?album=add" method="post">
												 <div class="form-group">
													<label class="col-md-1 control-label">相册名</label>
													<div class="col-sm-11">
													   <input type="text" name="albumName" class="form-control" placeholder="Text input">
													</div>
												  </div>
												   <div class="form-group">
													<label class="col-md-1 control-label">相册标签</label>
													<div class="col-sm-11">
													  <input type="text" name="albumTag" class="form-control" placeholder="Text input">
													</div>
												  </div>
												    <div class="form-group">
													 <label class="col-md-1 control-label">拥有者</label> 
													 <div class="col-md-11"> 
													 <input type="text" name="albumuserName" class="form-control" placeholder="Text input" value="${user.userName}"> 
													 </div>
												  </div>
                                               
												  
			
												  
												  									  <div>
			<p class="title_p">相册私密性:</p></br>
			<label for="choose_1" class="input_label choose_radio ">
				<input id="choose_1" name="albumPermission" value="1" type="radio" name="single" class="single_input" autocomplete ="off"/>
			</label>
			<p class="yijia_title_p">完全公开</p>
			<label for="choose_2" class="input_label choose_radio">
				<input id="choose_2"  name="albumPermission" value="0" type="radio" name="single" class="single_input" autocomplete ="off"/>
			</label>
			<p class="yijia_title_p">仅好友可见</p>
			<label for="choose_3" class="input_label choose_radio">
				<input id="choose_3" name="albumPermission" value="-1" type="radio" name="single" class="single_input" autocomplete ="off"/>
			</label>
			<p class="yijia_title_p">私密</p>
		</div>
												  
												
												  
										          <div class="form-group">
													<label class="col-md-5 control-label"></label>
													<div class="col-sm-7">
													<button class="btn btn-primary bnt-xs" type="submit">
													<i class="fa fa-pencil-square-o"></i> 确定
												    </button>
													</div>
												  </div>
										
												</form>
												
												 </c:if>
												 
				
  
  
  
  
  
  
  
  
  <!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22 -->
  
												  
												

  
  	<script src="js/jquery/jquery-2.0.3.min.js"></script>
  
  <script>
		$(".single_input").on("click",function(){
			var par_label = $(this).parent();
			if(this.checked){
            	$(".input_label").removeClass("choose_radioed").addClass("choose_radio");
            	par_label.removeClass("choose_radio").addClass("choose_radioed");
            }else{
            }
		});
	</script>

</html>
