package Servlet;

import JDBC.VO.Book_VO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

@WebServlet(name = "GoBuy",value = "/servlet/goBuy_test")
public class GoBuy_test extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookName = req.getParameter("bookName");
        int bookPress = Integer.parseInt(req.getParameter("bookPress"));
        int bookCount = Integer.parseInt(req.getParameter("count"));
        HttpSession session = req.getSession();
       Map<String,Book_VO> books = (Map<String, Book_VO>) session.getAttribute("books");
        if (books==null){
            books= (Map<String, Book_VO>) new ArrayList();
            session.setAttribute("books",books);
        }

    }

}
