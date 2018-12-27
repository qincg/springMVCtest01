<%--
  Created by IntelliJ IDEA.
  User: qcg
  Date: 2018/12/27
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="content-type" charset="UTF-8" content="text/html">
    <title>用户列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css"/>
</head>
<body>
<table class="layui-table" lay-even id="userTable">

</table>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use('table',function () {
        var table = layui.table;
        table.render({
            elem : '#userTable',
            url : '${pageContext.request.contextPath}/user/list',
            method : 'post',
            page : {
                layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'] //自定义分页布局
                ,groups: 3 //只显示 1 个连续页码
                ,first: true //不显示首页
                ,last: true //不显示尾页
            },
            cols : [[
                {field:'id',title:'Id',sort:true,fixed:"left"},
                {field:'username',title:'用户名',sort:true},
                {field:'password',title:'密码',sort:true}
            ]]
        });
    })
</script>
</body>
</html>
