<%@page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>登录</title>
        <link rel="stylesheet" href="layui/css/layui.css">
        <style>
            .input-my{
                padding-left:38px;
            }
            .label-my{
                position: absolute;
                width: 38px;
                line-height: 38px;
                text-align: center
            }
        </style>
    </head>
<body style="background: #f3f3f3;">
<div style="width: 100%;padding-top: 10%;">
    <div style="margin: 0 auto;width: 350px;">
        <div style="padding: 20px;text-align: center;font-size: 30px">
            <h2>myAdmin</h2>
        </div>
        <div style="padding: 20px">
            <form class="layui-form" method="get">
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-username label-my" for="username"></label>
                    <input id="username" name="username" class="layui-input input-my" type="text" required placeholder="请输入用户名" lay-verify="required" autocomplete="off">
                </div>
                <div class="layui-form-item">
                    <label class="layui-icon layui-icon-password label-my" for="password"></label>
                    <input id="password" name="password" class="layui-input input-my" type="password" required placeholder="请输入密码" lay-verify="required" autocomplete="off">
                </div>
                <div class="layui-form-item">
                    <button class="layui-btn layui-btn-normal layui-btn-fluid" lay-submit lay-filter="login">登录</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script src="layui/layui.js"></script>
<script>
    layui.use(['layer','form'],function () {
        var layer = layui.layer;
        var form = layui.form;
        var $ = layui.$;

        form.on('submit(login)',function (obj) {
            $.ajax({
                url:'user/login',
                data:obj.field,
                type:'post',
                dataType:'json',
                success:function (data) {
                    layer.msg(data.msg, {
                            offset:'t',
                            icon:1
                        });
                    if (data.status === "1") {
                        window.location.href='menu/main';
                    }
                },
                error:function (data) {
                }
            });
            return false;
        })

    })
</script>
</body>
</html>
