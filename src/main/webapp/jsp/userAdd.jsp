<%--
  Created by IntelliJ IDEA.
  User: qcg
  Date: 2019/1/9
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="content-type" charset="UTF-8" content="text/html">
    <title>增加用户</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
</head>
<body>
<form class="layui-form" id="addForm">
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" class="layui-input" id="username" name="username" required lay-verify="required" placeholder="请输入姓名">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="password" class="layui-input" id="password" name="password" required lay-verify="required">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">重复密码</label>
        <div class="layui-input-block">
            <input type="password" class="layui-input" id="password_" name="password_" required lay-verify="password_">
        </div>
    </div>
    <div class="layui-form-item layui-hide">
        <button class="layui-btn" lay-submit lay-filter="addSubmit" id="addSubmit">提交</button>
    </div>
</form>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use('form',function () {
        var form = layui.form;
        var $ = layui.$;
        // 验证规则
        form.verify({
            password_:function (value) {
                var passwordVal = $("#password").val();
                if (value != passwordVal){
                    return "两次密码输入不一致!";
                }
            }
        });
        // 表单提交
        form.on('submit(addSubmit)',function (data) {
            var index = parent.layer.getFrameIndex(window.name);
            $.ajax({
                url:'${pageContext.request.contextPath}/user/add',
                data:data.field,
                type:'post',
                dataType:'json',
                success:function (data) {
                    // 重载表格
                    parent.layui.table.reload("userTable");
                    if(data.status === "1"){
                        parent.layer.msg(data.msg, {
                            offset:'t',
                            icon:1
                        });
                    }else{
                        parent.layer.msg(data.msg,{
                            offset:'t',
                            icon:2
                        })
                    }
                    // 关闭
                    parent.layer.close(index);
                }
            });
            return false;
        })
    })
</script>
</body>
</html>
