<%@ page import="JDBC.VO.UserData" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="JDBC.DAO.GetBooks" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="JDBC.VO.Books" %><%--
  Created by IntelliJ IDEA.
  User: 17629
  Date: 2022/5/24
  Time: 15:58
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
    <link type="text/css" href="style/all.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" media="screen" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="style/airTools.css">
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
        HttpSession ses = request.getSession();
        UserData userData = (UserData) ses.getAttribute("userData");
        String userName = null;
        if (userData==null){
            userName="<a href='/2004220106LZY/index_login.jsp'>?????????</a>";
        }else{
            userName=userData.getNickname();
        }
    %>
    <p style="width: 25%">??????????????? ?????????<%=userName%>???</p>
    <div class="title">
        20???????????????????????????2004220106???????????????
    </div>
    <div style="width: 25%;" class="headerRight">
    <div class="headerForm">
        <form method="post" action="servlet/SerchServlet" class="selectBook">
            <i class="fa fa-search" aria-hidden="true"></i>
            <input type="text" name="selectName" style="border: none;color: gray;">
            <input type="text" name="serchUser" value="0" readonly hidden>
            <input type="submit" value="??????">
        </form>
    </div>
    <div style="display: flex;align-items: center;">
    <a href="needInspect/shoppingTrolley.jsp" style="text-decoration: none;color:orange">
        <i class="fa fa-shopping-bag" aria-hidden="true"></i>
           <span style="color: white">???????????????</span> </a>
    </div>
    </div>
</header>
<hr>
<div class="airBtn" id="btn01">
<%--    <div class="aBtn" >--%>
<%--        <a href="needInspect/addBook.jsp" style="text-decoration: none;color: gray">--%>
<%--            ????????????--%>
<%--        </a>--%>
<%--    </div>--%>
    <div class="aBtn" >
        <a href="store.jsp#goTop" style="text-decoration: none;color: gray">
            ????????????
        </a>
    </div>
</div>
<table  class="book">
    <tr>
        <th>?????????</th>
        <th>??????</th>
        <th>????????????</th>
        <th>??????</th>
        <th>????????????</th>
        <th>??????</th>
        <th></th>
    </tr>

        <%
            GetBooks getBooks=new GetBooks();
            ArrayList books = getBooks.returnBooks();
            for (int i=0;i< books.size();i++){
                Books book= (Books) books.get(i);
                %>
    <tr>
        <td class="bookImg"><img src="<%=book.getBookImg()%>"></td>
        <td style="width: 140px"><%=book.getName()%></td>
        <td class="bookIntro"><%=book.getBook_intro()%></td>
        <td style="width: 100px"><%=book.getAuthor()%></td>
        <td class="authoIntro"><%=book.getAuthor_intro()%></td>
        <td style="width: 50px"><span style="color: red;text-decoration: underline"><%=book.getPress()%></span>???</td>
        <td style="width: 100px"><a href="needInspect/goBuy.jsp?bookName=<%=book.getName()%>&bookPress=<%=book.getPress()%>">???????????????</a> </td>
    </tr>
        <%
            }
        %>
</table>
</body>
<script src="javascript/airTools.js"></script>
<script>
    <%
        String end = request.getParameter("end");
        String serchEnd = request.getParameter("serchEnd");
    %>
    let end=<%=end%>;
    let serchEnd=<%=serchEnd%>
    if (end==0){
        alert("???????????????")
    }else if (end==1){
        alert("???????????????")
    }else if (serchEnd==0){
        alert("???????????????????????????")
    }
</script>
</html>
