<%@page contentType="text/html;charset=UTF-8" isELIgnored="false" %>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>欢迎</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    </head>
<body>
<h2>Hello World!</h2>
<script src="${pageContext.request.contextPath}/layui/layui.js"></script>
<script>
    layui.use(['layer','form'],function () {
        var layer = layui.layer;
        var form = layui.form;

        layer.msg("hello");
    })
</script>
</body>
</html>
