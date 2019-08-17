<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  ~
  ~ www.prosysoft.com Inc.
  ~ Copyright (c) 2019  All Rights Reserved
  --%>

<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>投诉管理</title>

    <!-- Bootstrap -->
    <link href="<c:url value="/manager/bootstrap-dist/css/bootstrap.min.css" />"  rel="stylesheet">
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
  <!-- <script src="<c:url value="/manager/js/complaint/manage_compaint_list.js"/>"></script> --> 
</head>
<body>
<div class="container-fluid" style="margin: 25px;">
    <div class="row">
        <table class="table table-bordered table-hover" style="margin-top: 5px;">
            <thead>
            <tr>
                <th>投诉类型</th>
                <th>投诉ID</th>
                <th>投诉人</th>
                <th>被投诉人</th>
                <th>投诉内容</th>
                <th>投诉时间</th>
                <th>申诉时间</th>
                <th>申诉理由</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="c" items="${complaintList}">
                <tr>
                    <td class="text-center">
                        <c:choose>
                            <c:when test="${c.complaintType == 0}">
                                账号
                            </c:when>
                            <c:when test="${c.complaintType == 1}">
                                日志
                            </c:when>
                            <c:when test="${c.complaintType == 2}">
                                相册
                            </c:when>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${c.complaintType == 0}">
                                账号id:${c.complaintTargetId}
                            </c:when>
                            <c:when test="${c.complaintType == 1}">
                                日志id:${c.complaintTargetId}
                            </c:when>
                            <c:when test="${c.complaintType == 2}">
                                照片id:${c.complaintTargetId}
                            </c:when>
                        </c:choose>
                    </td>
                    <td>${c.userName}</td>
                    <td>${c.complaintedUserName}</td>
                    <td>${c.complaintDesc}</td>
                    <td>${c.complaintTime}</td>
                    <td>${c.appealTime}</td>
                    <td>
                            ${c.appealReason}
                    </td>
                    <td>
                            <%-- 处理状态  0 待审核 1 投诉驳回 2 同意投诉  3 有申诉   4 申诉成功  5申诉失败--%>
                        <c:choose>
                            <c:when test="${c.processStatus == 0}">
                                待审核
                            </c:when>
                            <c:when test="${c.processStatus == 1}">
                                投诉驳回
                            </c:when>
                            <c:when test="${c.processStatus == 2}">
                                同意投诉
                            </c:when>
                            <c:when test="${c.processStatus == 3}">
                                申诉审核中
                            </c:when>
                            <c:when test="${c.processStatus == 4}">
                                申诉成功
                            </c:when>
                            <c:when test="${c.processStatus == 5}">
                                申诉失败
                            </c:when>
                        </c:choose>
                    </td>
                    <td>
                        <button type="button" class="btn btn-primary" onclick="showProcessList(${c.id})"><i
                                class="fa fa-info"></i> 处理记录
                        </button>
                        <c:if test="${c.processStatus == 0 || c.processStatus == 3}">
                            <button type="button" class="btn btn-success" onclick="audit(${c.id})"><i
                                    class="fa fa-search"></i> 审核
                            </button>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>

<div style="display: none;" id="audit_form_container">
    <form class="form-horizontal">
        <div class="form-group">
            <label class="col-sm-2 control-label">处理方式</label>
            <div class="col-sm-6" >
                <select class="form-control" name="processResult">
                    <option value="">请选择</option>
                    <option value="0">拒绝</option>
                    <option value="1">受理</option>
                </select>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">处理原因</label>
            <div class="col-sm-6" >
                <textarea class="form-control" rows="3" name="processReason"></textarea>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    /**
     * 查看投诉处理记录
     */
    function showProcessList(id) {
        layer.open({
            type: 2,
            title: "投诉处理记录",
            shade: [0],
            area: ['600px', '400px'],
            anim: 2,
            content: ['${pageContext.request.contextPath}/user/complaint/getProcessLogList.do?complaintId='+id, 'no'], //iframe的url，no代表不显示滚动条
        });
    }

    function audit(id) {
        layer.open({
            type: 1,
            title : "投诉/申诉受理",
            area: ['600px', '300px'],
            content: $('#audit_form_container'),
            btn: ['提交', '取消'],
            scrollbar: false,
            yes : function(index,layero){

                var processResult = $("#audit_form_container select option:selected").val();
                var processReason = $("#audit_form_container textarea").val();

                if(!processResult || processResult == ""){
                    layer.msg("处理结论必须选择",{icon:2});
                    return false;
                }
                if(!processReason || processReason == ""){
                    layer.msg("处理原因必须输入",{icon:2});
                    return false;
                }

                $.post("${pageContext.request.contextPath}/manage/complaint/audit.do?",{id:id,processResult:processResult,processReason:processReason},function (result) {
                    if(result.success){
                       layer.msg(result.msg, {icon: 1,},
                    function(){
                            window.location.reload();
                            layer.close(index);
                        });
                    }
                    else {
                        layer.msg(result.msg, {icon: 2});
                    }
                })
            },
            btn2 : function (index,layero) {
                window.location.reload();
                layer.close(index);
            }
        });


    }
</script>

</html>
