<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="JDBC.VO.Book_VO" %><%--
  Created by IntelliJ IDEA.
  User: 17629
  Date: 2022/5/26
  Time: 13:20
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
<style>
    .cart{
        border: #559CF5 solid 2px;
        border-radius: 10px;
    }
    .cart td{
        border: #559CF5 1px solid;
        border-radius: 2px;
    }
</style>
<body>
<table class="cart">
    <tr class="tableTitle">
        <th>书名</th>
        <th>价格</th>
        <th>购买数量</th>
    </tr>
    <%
        HttpSession session1 = request.getSession();
        ArrayList books = (ArrayList) session1.getAttribute("books");
        if (books==null){
            books=new ArrayList();
        }
        float allPress=0;
        for (int i=0;i<books.size();i++){
            Book_VO book_vo = (Book_VO) books.get(i);
            allPress=allPress+book_vo.getBookPress()*book_vo.getBookCount();
    %>
    <tr>
        <td><%=book_vo.getBookName()%></td>
        <td><%=book_vo.getBookPress()%>元</td>
        <td><%=book_vo.getBookCount()%>本</td>
        <td><a href="servlet/delCart?bookName=<%=book_vo.getBookName()%>">删除</a></td>
    </tr>
        <%
        }
    %>
    <tr>
        <td>总计<%=books.size()%>种图书</td>
        <td>总计<%=allPress%>元</td>
        <td><a href="servlet/truncateCart">清空购物车</a></td>
        <td><a href="/2004220106LZY/store.jsp">返回购物</a></td>
    </tr>
</table>
</body>
</html>
