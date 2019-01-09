<%--
  Created by IntelliJ IDEA.
  User: qcg
  Date: 2018/12/25
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="content-type" charset="UTF-8" content="text/html">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
    <style>
        .myAdmin-iframe{
            width: 100%;
            height: 100%;
            left: 0;
            top: 0;
            right: 0;
            bottom: 0;
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <%--头部导航---start--%>
    <div class="layui-header">
        <div class="layui-logo">后台布局</div>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                ${sessionScope.username}
                <dl class="layui-nav-child">
                    <dd><a>11</a></dd>
                    <dd><a>22</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">退出</li>
        </ul>
    </div>
    <%--左侧菜单--%>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="myAdmintree">
                <c:forEach items="${requestScope.menuData}" var="menu">
                    <li class="layui-nav-item">
                        <a href="javascript:void(0);" lay-href="${menu.href}" id="${menu.id}">${menu.title}</a>
                        <dl class="layui-nav-child">
                            <c:forEach items="${menu.childs}" var="child">
                                <dd>
                                    <a href="javascript:void(0);" lay-href="${child.href}" id="${child.id}">${child.title}</a>
                                </dd>
                            </c:forEach>
                        </dl>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <%--右侧内容区域--%>
    <div class="layui-body">
        <div class="layui-tab" lay-allowClose="true" lay-filter="myAdminTab">
            <ul class="layui-tab-title">
                <li class="layui-this">首页</li>
            </ul>
            <div class="layui-tab-content">
                <div class="layui-tab-item layui-show"> 1</div>
            </div>
        </div>
    </div>
    <div class="layui-footer">
        <center>哈哈</center>
    </div>
</div>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use('element',function () {
        var element = layui.element;
        element.on('nav(myAdmintree)',function (elem) {
            var url = elem.context.attributes['lay-href'].value;
            var title = elem.context.innerHTML;
            var id = elem.context.id;
            element.tabAdd('myAdminTab', {
                title: title,
                content : '<iframe src= "${pageContext.request.contextPath}' + url + '" class="myAdmin-iframe"></iframe>',
                id : id
            });
            element.tabChange('myAdminTab',id);
        })
    })
</script>
</body>
</html>
