<%--
  Created by IntelliJ IDEA.
  User: 17629
  Date: 2022/5/24
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%
String path=request.getContextPath();
String basePath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>$Title$</title>
  </head>
  <body>
  <form method="post" action="servlet/Login">
    账号：<input type="text" placeholder="账号" name="account"><br>
    密码：<input type="password" placeholder="密码" name="password"><br>
    <input type="submit" value="登陆">
    <input type="button" value="注册" onclick="go()">
  </form>
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
