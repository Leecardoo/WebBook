<%--
  Created by IntelliJ IDEA.
  User: 17629
  Date: 2022/5/24
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<body>
<form method="post" action="servlet/SignIn">
    账号：<input type="text" name="account" placeholder="账号"><br>
    密码：<input type="password" name="password" placeholder="密码"><br>
    昵称：<input type="text" name="nickname" placeholder="昵称"><br>
    <input type="submit" value="注册">
    <input type="button" value="返回登陆页面" onclick="go()">
</form>
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
        location="index.jsp"
    }
</script>
</html>
