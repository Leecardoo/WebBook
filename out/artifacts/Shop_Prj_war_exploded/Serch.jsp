<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="JDBC.VO.SelectBookVo" %>
<%@ page import="JDBC.VO.UserData" %><%--
  Created by IntelliJ IDEA.
  User: 17629
  Date: 2022/5/28
  Time: 18:24
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
    .book{
        color: white;
        border: solid 1px black;
        border-spacing: 4px;
        border-radius: 5px;
        background-color: #6668ab;
        width: 100%;
    }
    .book td {
        border: solid 1px black;
        border-radius: 4px;
    }
    .book th{
        border-radius: 4px;
        background-color: gray;
        color: white;
    }

    .book a{
        text-decoration: none;
        color: white;
    }
    header{
        background-color: #6668ab;
        font-size: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        color: white;
    }
    .title{
        height: 100%;
        width: 50%;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
        font-size: 24px;
    }
    .bookImg {
        width: 110px;
        padding: 5px;
    }
    .bookImg img{
        width: 100%;
    }
    .selectBook{
        padding-top:25px;
        box-sizing: border-box;
        height: 50px;
        display: flex;
        align-items: center;
    }
    .headerForm{
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
    }
    .headerRight{
        width: 25%;
        display: flex;
        align-items: center;
        justify-content: space-around;
    }
</style>
<body>
<header id="goTop">
    <%
        String serchuser="0";
        String serchUser = request.getParameter("serchUser");
        if (serchUser!=null){
            serchuser=serchUser;
        }
        HttpSession ses = request.getSession();
        UserData userData = (UserData) ses.getAttribute("userData");
        String userName = null;
        if (userData==null){
            userName="<a href='/2004220106LZY/index_login.jsp'>请登录</a>";
        }else{
            userName=userData.getNickname();
        }
    %>
    <p style="width: 25%">欢迎购物！ 您好，<%=userName%>！<a href="store.jsp">返回购物页面</a></p>
    <div class="title">
       20级大数据一班李智源2004220106网上图书店
    </div>
    <div style="width: 25%;" class="headerRight">
        <div class="headerForm">
            <form method="post" action="servlet/SerchServlet" class="selectBook">
                <i class="fa fa-search" aria-hidden="true"></i>
                <input type="text" name="selectName" style="border: none;color: gray;">
                <input type="text" name="serchUser" value="<%=serchuser%>" readonly hidden>
                <input type="submit" value="搜索">
            </form>
        </div>
        <div style="display: flex;align-items: center;">
            <a href="needInspect/shoppingTrolley.jsp" style="text-decoration: none;color:orange">
                <i class="fa fa-shopping-bag" aria-hidden="true"></i>
                <span style="color: white">前往购物车</span> </a>
        </div>
    </div>
</header>
<hr>
<%--<div class="airBtn" id="btn01">--%>
<%--        <div class="aBtn" >--%>
<%--            <a href="needInspect/addBook.jsp" style="text-decoration: none;color: gray">--%>
<%--                添加图书--%>
<%--            </a>--%>
<%--        </div>--%>
<%--    <div class="aBtn" >--%>
<%--        <a href="store.jsp#goTop" style="text-decoration: none;color: gray">--%>
<%--            返回顶部--%>
<%--        </a>--%>
<%--    </div>--%>
<%--</div>--%>
<table  class="book">
    <tr>
        <th>展示图</th>
        <th>书名</th>
        <th>作品简介</th>
        <th>作者</th>
        <th>作者简介</th>
        <th>价格</th>
        <th></th>
    </tr>

    <%
        HttpSession session1 = request.getSession();
        ArrayList selectedBooks = (ArrayList) session1.getAttribute("selectedBooks");
        for (int i=0;i<selectedBooks.size();i++){
           SelectBookVo book = (SelectBookVo) selectedBooks.get(i);

    %>
    <tr>
        <td class="bookImg"><img src="<%=book.getBookImg()%>"></td>
        <td style="width: 140px"><%=book.getName()%></td>
        <td class="bookIntro"><%=book.getBook_intro()%></td>
        <td style="width: 100px"><%=book.getAuthor()%></td>
        <td class="authoIntro"><%=book.getAuthor_intro()%></td>
        <td style="width: 50px"><span style="color: red;text-decoration: underline"><%=book.getPress()%></span>元</td>
        <%if (serchUser.equals("0")){%>
        <td style="width: 100px"><a href="needInspect/goBuy.jsp?bookName=<%=book.getName()%>&bookPress=<%=book.getPress()%>">加入购物车</a> </td>
        <%}else {%>
        <td style="width: 100px"><a href="javascript:dleBook('<%=book.getName()%>')">删除图书</a><a href="servlet/delBook?bName=<%=book.getName()%>" id="<%=book.getName()%>" style="visibility: hidden"></a> </td>
        <%}%>
    </tr>
    <%
        }
    %>
</table>
</body>
<script src="javascript/airTools.js"></script>
<script>
    function dleBook(bookName){
        if (confirm("确定删除图书"+bookName+"?")){
            document.getElementById(bookName).click();
        }
    }
</script>
</html>
