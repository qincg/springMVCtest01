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
    <title>首页</title>
    <link rel="stylesheet" href="../layui/css/layui.css"/>
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
    <%--头部导航----end--%>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree" lay-filter="myAdmintree">
                <c:forEach items="${requestScope.menuData}" var="menu">
                    <li class="layui-nav-item">
                        <a href="${menu.href}">${menu.title}</a>
                        <dl class="layui-nav-child">
                            <c:forEach items="${menu.childs}" var="child">
                                <dd>
                                    <a lay-href="${child.href}">${child.title}</a>
                                </dd>
                            </c:forEach>
                        </dl>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<script src="../layui/layui.js"></script>
<script>
    layui.use('element',function () {
        var element = layui.element;

    })
</script>
</body>
</html>
