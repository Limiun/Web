<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link href="<c:url value="/manager/bootstrap-dist/css/bootstrap.min.css"/>" type="text/css" rel="stylesheet">
    <link href="<c:url value="/manager/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/manager/js/layer/theme/default/layer.css"/>"  rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <script src="<c:url value="/manager/js/jquery/jquery-2.0.3.min.js"/>"></script>
    <script src="<c:url value="/manager/bootstrap-dist/js/bootstrap.min.js"/>"></script>
    <script src="<c:url value="/manager/js/layer/layer.js"/>"></script>
</head>
<body>
<div class="container-fluid" style="margin: 25px;">
    <div class="row">
        <button type="button" class="btn btn-info" onclick="addComplaint()"><i class="fa fa-plus"></i> 我要投诉</button>
    </div>
    <div class="row">
        <table class="table table-bordered table-hover" style="margin-top: 5px;">
            <thead>
            <tr>
                <th>投诉类型</th>
                <th>投诉ID</th>
                <th>投诉人</th>
                <th>投诉内容</th>
                <th>投诉时间</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="c" items="${complaints}">
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
                    <td>${c.complaintedUserName}</td>
                    <td>${c.complaintDesc}</td>
                    <td>${c.complaintTime}</td>
                    <td>
                            <%-- 处理状态  0待审核  1投诉驳回 2同意投诉  3有申诉   4申诉成功  5申诉失败--%>
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
                        <c:if test="${c.processStatus==2 && c.complaintedUserId==currUserId}">
                            <button type="button" class="btn btn-success" onclick="appeal(${c.id})"><i
                                    class="fa fa-mail-replay"></i> 申诉
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

<div class="container" style="display: none;" id="add_form_container">
    <form class="form-horizontal" id="add_form">
        <div class="form-group">
            <label class="col-sm-2 control-label">投诉类型</label>
            <div class="col-sm-8">
                <label class="radio-inline">
                    <input type="radio" name="complaintType" value="0" onclick="hide_complaint_target()" checked/> 账户
                </label>
                <label class="radio-inline">
                    <input type="radio" name="complaintType" value="1" onclick="change_show_label('日志id')"/> 日志
                </label>
                <label class="radio-inline">
                    <input type="radio" name="complaintType" value="2" onclick="change_show_label('照片id')"/> 相册
                </label>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label"><i style="color: red">*</i>投诉用户名</label>
            <div class="col-sm-4">
                <input type="text" name="complaintedUserName"  class="form-control"/>
            </div>
        </div>
        <div class="form-group" style="display: none;" id="target_id_container">
            <label class="col-sm-2 control-label" id="target_id_label"></label>
            <div class="col-sm-4">
                <input type="text" name="complaintTargetId" data-desc=""  class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label"><i style="color: red">*</i>描述</label>
            <div class="col-sm-4">
                <textarea class="form-control" rows="3" name="complaintDesc"></textarea>
            </div>
        </div>
    </form>
</div>


<script type="text/javascript">

    function hide_complaint_target() {   
        $("input[name='complaintTargetId']").val("");
        $("#target_id_label").html("");
        $("#target_id_container").hide();
    }

    function change_show_label(lab) {
        $('#target_id_label').html("");
        $("input[name='complaintTargetId']").val("");
        $('#target_id_label').append("<i style='color: red'>*</i>"+lab);
        $("input[name='complaintTargetId']").attr("data-desc",lab);
        $("#target_id_container").show();
    }

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

    /**
     * 申诉
     */
    function appeal(id) {
        layer.prompt({title: '填写申诉理由', formType: 2}, function(appealReason, index){
            $.post("${pageContext.request.contextPath}/user/complaint/appeal.do",{id:id,appealReason:appealReason},function(result){
                if(result.success){
                    layer.msg(result.msg, {icon: 1,},
                    function(){
                            window.location.reload();
                            layer.close(index);
                        });
              
                }
                else{
                    layer.msg(result.msg, {icon: 2});
                }
            });
        });



    }

    /**
     * 添加投诉
     */
    function addComplaint() {

        $("#add_form input:text").each(function (idx,input) {
            $(input).val("");
        });

        $("#add_form textarea").each(function (idx,input) {
            $(input).val("");
        });

        $('input[type=radio][name="complaintType"]:checked').attr("checked", false);
        $('#add_form input[type=radio][value="0"]').prop("checked", true);

        $("#target_id_label").html("");
        $("#target_id_container").hide();


        layer.open({
            type: 1,
            area: ['600px', '300px'],
            content: $('#add_form_container'),
            btn: ['提交', '取消'],
            yes : function(index,layero){

                if(!$("input[name='complaintedUserName']").val() || $("input[name='complaintedUserName']").val() == ""){
                    layer.msg("投诉用户名必须填写",{icon:2});
                    return false;
                }

                if($("input[name='complaintType']:checked").val() != 0){
                    if(!$("input[name='complaintTargetId']").val() || $("input[name='complaintTargetId']").val() == ""){
                        layer.msg($("input[name='complaintTargetId']").attr("data-desc")+"必须填写",{icon:2});
                        return false;
                    }
                }

                if(!$("textarea[name='complaintDesc']").val() || $("textarea[name='complaintDesc']").val() == ""){
                    layer.msg("投诉描述必须填写",{icon:2});
                    return false;
                }

                $.post("${pageContext.request.contextPath}/user/complaint/createComplaint.do?"+$("#add_form").serialize(),function (result) {
                    if(result.success){
                       layer.msg(result.msg, {icon: 1,}, function(){
                            window.location.reload();
                        });
                    }
                    else {
                        layer.msg(result.msg, {icon: 2});
                    }
                })
            },
            btn2 : function (index,layero) {
                layer.close(index);
            }
        });
    }
</script>
</html>
