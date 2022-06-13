<%--
  Created by IntelliJ IDEA.
  User: 17629
  Date: 2022/5/28
  Time: 10:52
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
    <title>添加图书</title>
</head>
<style>
    #addBookForm{
        text-align: center;
    }
</style>
<body>
<form  method="post" action="servlet/AddBookServlet" id="addBookForm">
    书名<input type="text" name="bookName" placeholder="例:《三体》" required><br>
    作者<input type="text" name="author" placeholder="作品作者" required><br>
    &nbsp;&nbsp;&nbsp;
    售价<input type="number" name="press" placeholder="售价：元" required>元<br>
    图书图片网址<br><input type="url" name="bookImg" placeholder="图片网址" required><br>

作品简介
    <br><textarea form="addBookForm" name="bookIntro" maxlength="250" placeholder="不超过250个字符" cols="35" rows="10"></textarea><br>
作者简介<br><textarea form="addBookForm" name="authorIntro" maxlength="250" placeholder="不超过250个字符"  cols="35" rows="10"></textarea><br>
    <input type="submit" value="提交"><input type="reset" value="重置">
</form>
</body>
<script>
    <%
        String end = request.getParameter("end");

    %>
    let end=<%=end%>;
    if (end==0){
        alert('添加成功！')
        location="/2004220106LZY/needInspect/manager.jsp"
    }else if (end==1){
        alert("添加失败！")
    }
</script>
</html>
