<%--
  Created by IntelliJ IDEA.
  User: 17629
  Date: 2022/5/27
  Time: 13:49
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
    <title>登陆首页</title>
    <link rel="stylesheet" href="style/two_style.css">

</head>
<body>
<div class="d1">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" media="screen" rel="stylesheet" type="text/css">
    <i class="fa fa-shopping-bag" aria-hidden="true"></i>&nbsp;<b>网上</b><span>书店</span>
</div>
<div class="d2">
    <form action="servlet/Login" method="POST">
        <h1>用户登录</h1>

        <i class="fa fa-user-circle-o" aria-hidden="true" fa-3x ></i>
        <input type="text" name="account" placeholder="账号">
        <br>
        <i class="fa fa-key" aria-hidden="true" fa-3x ></i>
        <input type="password" name="password" placeholder="密码"><br>
        <input type="submit" value="登录" class="dl"><br>
        <select name="loginUser">
            <option value="0">普通用户</option>
            <option value="1">管理员</option>
        </select>
        <input type="button" onclick="location='index_SignIn.jsp'" class="b1" value="用户注册">
    </form>
</div>
</body>
<script>
    <%
      String end = request.getParameter("end");
    %>
    let end=<%=end%>;
    if(end==1){
        alert("登陆失败！")
    }
    let go=()=>{
        location="SignIn.jsp"
    }
</script>
</html>
