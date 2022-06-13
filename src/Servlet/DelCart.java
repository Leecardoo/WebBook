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

@WebServlet(name = "DelCart",value = "/servlet/delCart")
public class DelCart extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookName = req.getParameter("bookName");
        HttpSession session = req.getSession();
        ArrayList books = (ArrayList) session.getAttribute("books");
        for (int i=0;i<books.size();i++){
            Book_VO o = (Book_VO) books.get(i);
            if (o.getBookName().equals(bookName)){
                books.remove(o);
                resp.sendRedirect("/2004220106LZY/needInspect/shoppingTrolley.jsp");
            }
        }
    }
}
