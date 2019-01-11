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
    <style>
        .layui-table-cell .layui-form-checkbox[lay-skin="primary"]{
            top: 50%;
            transform: translateY(-50%);
        }
    </style>
</head>
<body>
<table class="layui-table" lay-even id="userTable" lay-filter="userTableFilter">

</table>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use(['table','jquery'],function () {
        var table = layui.table;
        var $ = layui.$;
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
                {type:'checkbox'},
                {field:'id',title:'Id',sort:true},
                {field:'username',title:'用户名',sort:true},
                {field:'password',title:'密码',sort:true}
            ]],
            toolbar:'default',
            defaultToolbar: ['filter', 'print', 'exports'],
            height:500
        });
        table.on('toolbar(userTableFilter)',function (obj) {
            var checkStatus = table.checkStatus('userTable');
            var dataCount = checkStatus.data.length;
            console.log(checkStatus);
            switch (obj.event) {
                case 'add':
                    layer.open({
                        type:2,
                        content:['${pageContext.request.contextPath}/user/add','no'],
                        btn:['提交','取消'],
                        yes:function (index, layero) {
                            var submitButton = layero.find('iframe').contents().find('#addSubmit');
                            submitButton.click();
                        }
                    });
                    break;
                case 'delete':
                    if(dataCount === 0){
                        layer.alert('请至少选择一项！');
                    }
                    break;
                case 'update':
                    if(dataCount !== 1){
                        layer.alert('请选择一项！');
                    }
                    break;
            }
        })
    })
</script>
</body>
</html>
