<%--
  Created by IntelliJ IDEA.
  User: 17629
  Date: 2022/5/26
  Time: 12:07
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
<%
    String bookName = request.getParameter("bookName");
    String bookPress = request.getParameter("bookPress");

%>
<form method="post" action="servlet/goBuy" style="color: gray">
    书名:<input type="text" value="<%=bookName%>" name="bookName"  readonly="true" onfocus="this.style.border='none'" style="border: none;font-size: 24px;color: gray">
    价格:<input type="number" value="<%=bookPress%>" name="bookPress" readonly="true" onfocus="this.style.border='none'" style="width:50px;border: none;font-size: 24px;color: gray"><br>
    <br>
    请确认购买数量:<input type="number" name="count" style="font-size: 24px;width:50px;height: 25px" value="1" min="1" max="10">
    <input type="submit" value="添加到购物车">
</form>
</body>
</html>
