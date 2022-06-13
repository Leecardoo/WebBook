<%--
  Created by IntelliJ IDEA.
  User: 17629
  Date: 2022/5/27
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>网上书店在线管理</title>
    <link rel="stylesheet" href="./style/style.css">

</head>
<body>
<div class="d1">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" media="screen" rel="stylesheet" type="text/css">
    <i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;<b>用户注册</b>
</div>
<div class="d2">
    <h1>用户注册</h1>
    <form action="servlet/SignIn" method="POST">
        <i class="fa fa-user-circle-o" aria-hidden="true" fa-lg ></i>
        <label for="zhanghao"></label>
        <input type="text" id="zhanghao" placeholder="账号" name="account"><br>
        <br>
        <i class="fa fa-key" aria-hidden="true" fa-lg ></i>
        <label for="password"></label>
        <input type="password" id="password" placeholder="密码" name="password"><br>
        <br>
        <i class="fa fa-address-card-o" aria-hidden="true"></i>
        <label for="zhuJidz"></label>
        <input type="text" id="zhuJidz" placeholder="昵称" name="nickname"><br>
        <br>
        <input type="submit" value="注册" class="dl" ><br>
        <input type="button" onclick="location='index_login.jsp'" class="b1" value="返回登陆">
    </form>
</div>
</body>
<script>
    function go(){
        location="index.jsp"
    };
    <%
    String end = request.getParameter("end");
  %>
    let end=<%=end%>;
    if(end==1){
        alert("注册失败！")
    }else if (end==0){
        alert("注册成功，将前往登录页面！")
        location="index_login.jsp"
    }
</script>
</html>
