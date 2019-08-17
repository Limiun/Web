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
    <link href="<c:url value="/manager/bootstrap-dist/css/bootstrap.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/manager/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
    <link href="<c:url value="/manager/js/layer/theme/default/layer.css" />" rel="stylesheet">

    <!-- HTML5 shim 和 Respond.js 是为了让 IE8 支持 HTML5 元素和媒体查询（media queries）功能 -->
    <!-- 警告：通过 file:// 协议（就是直接将 html 页面拖拽到浏览器中）访问页面时 Respond.js 不起作用 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <script src="<c:url value="/manager/js/jquery/jquery-2.0.3.min.js"/>" ></script>
    <script src="<c:url value="/manager/bootstrap-dist/js/bootstrap.min.js"/>"></script>
</head>
<body>
<div class="container-fluid" style="margin: 25px;">
    <div class="row">
        <table class="table table-bordered table-hover" style="margin-top: 5px;">
            <thead>
            <tr>
                <th>处理时间</th>
                <th>处理结果</th>
                <th>处理原因</th>
                <th>类型</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="p" items="${processLogList}">
                <tr>
                    <td class="text-center">
                        ${p.processTime}
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${p.processResult == 0}">
                                拒绝
                            </c:when>
                            <c:otherwise>
                                受理
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>${p.processReason}</td>
                    <td>
                        <c:choose>
                            <c:when test="${p.processType == 0}">
                                投诉
                            </c:when>
                            <c:when test="${p.processType == 1}">
                                申诉
                            </c:when>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
