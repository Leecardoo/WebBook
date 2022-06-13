package Servlet;

import JDBC.DAO.SelectBook;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "SerchServlet",value = "/servlet/SerchServlet")
public class SerchServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String selectName = req.getParameter("selectName");
        String serchUser = req.getParameter("serchUser");
        SelectBook selecter=new SelectBook();
        try {
            ArrayList selectedBooks= selecter.selectBook(selectName);

            if (selectedBooks.size()==0){
                String requestUrl = req.getHeader("referer");
                resp.sendRedirect(requestUrl+"?serchEnd=0");
            }else {
                HttpSession session = req.getSession();
                session.setAttribute("selectedBooks", selectedBooks);
                resp.sendRedirect("/2004220106LZY/Serch.jsp?serchUser="+serchUser);
            }
        } catch (ClassNotFoundException |SQLException e) {
            e.printStackTrace();
        }

    }
}
