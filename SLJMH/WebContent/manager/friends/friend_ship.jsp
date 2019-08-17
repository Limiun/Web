<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>好友管理</title>

    <!-- Bootstrap -->
    <link href="<c:url value="/manager/bootstrap-dist/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/manager/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
    <link href="<c:url value="/manager/js/layer/theme/default/layer.css" />" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <script src="<c:url value="/manager/js/jquery/jquery-2.0.3.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/manager/bootstrap-dist/js/bootstrap.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/manager/js/layer/layer.js"/>" type="text/javascript"></script>
</head>
<body>
<div class="container-fluid" style="margin: 25px;">
    <div class="row">
        <button type="button" class="btn btn-info" onclick="addFriend()"><i class="fa fa-user-md"></i> 加好友</button>
    </div>
    <div class="row">
        <table class="table table-bordered table-hover" style="margin-top: 5px;">
            <thead>
            <tr>
                <th>好友昵称</th>
                <th>备注</th>
                <th>添加时间</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="f" items="${friends}" varStatus="status">
                    <tr>
                      
                        <td>${f.friendNickName}</td>
                        <td>${f.remark}</td>
                        <td>${f.addTime}</td>
                        <td>
                            <c:choose>
                                <c:when test="${f.status == 0}">
                                    等待接受
                                </c:when>
                                <c:when test="${f.status == 1}">
                                    好友
                                </c:when>
                                <c:when test="${f.status == 2}">
                                    对方删除
                                </c:when>
                            </c:choose>
                        </td>
                        <td>
                            <c:if test="${f.status == 1 || f.status == 2}">
                                <button type="button" class="btn btn-primary" onclick="modify_remark(${f.id})"><i class="fa fa-edit"></i> 修改备注</button>
                                <button type="button" class="btn btn-danger" onclick="del(${f.id})"><i class="fa fa-remove"></i> 删除</button>
                            </c:if>
                            <c:if test="${f.status == 0}">
                                <button type="button" class="btn btn-success" onclick="agree(${f.id})"><i class="fa fa-check"></i> 接受</button>
                            </c:if>

                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
<script type="text/javascript">

    /**
     * 删除好友关系
     */
    function del(id) {
        layer.confirm('确认要删除该好友？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.post("${pageContext.request.contextPath}/friends/del.do",{id:id},function(result){
                if(result.success){
                    layer.msg(result.msg, {icon: 1});
                    window.location.reload();
                    layer.closeAll();
                }
                else{
                    layer.msg(result.msg, {icon: 2});
                }
            })
        }, function(){
            layer.closeAll();
        });
    }

    /**
     * 修改备注
     */
    function modify_remark(id) {
        layer.prompt({title: '修改备注', formType: 0}, function(remark, index){
            $.post("${pageContext.request.contextPath}/friends/updateRemark.do",{id:id,remark:remark},function(result){
                if(result.success){
                    layer.msg(result.msg, {icon: 1});
                    window.location.reload();
                    layer.close(index);
                }
                else{
                    layer.msg(result.msg, {icon: 2});
                }
            });
        });
    }

    /**
     * 接受对方好友请求
     * @param id
     */
    function agree(id) {
        layer.confirm('接受好友请求？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            $.post("${pageContext.request.contextPath}/friends/agree.do",{id:id},function(result){
                if(result.success){
                    layer.msg(result.msg, {icon: 1});
                    window.location.reload();
                    layer.close(index);
                }
                else{
                    layer.msg(result.msg, {icon: 2});
                }
            },"json");
        }, function(){
            layer.closeAll();
        });

    }

    function addFriend() {
        layer.prompt({title: '添加好友-请输入好友昵称', formType: 0}, function(searchKey, index){
            $.post("${pageContext.request.contextPath}/friends/addFriend.do",{friendUserKey:searchKey},function(result){
                if(result.success){
                    layer.msg(result.msg, {icon: 1});
                    window.location.reload();
                    layer.close(index);
                }
                else{
                    layer.msg(result.msg, {icon: 2});
                }
            });
        });
    }


</script>
</html>
