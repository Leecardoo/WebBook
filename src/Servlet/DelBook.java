package Servlet;

import JDBC.DAO.DeleteBook;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "DelBook",value = "/servlet/delBook")
public class DelBook extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bName = req.getParameter("bName");
        DeleteBook dB=new DeleteBook();
        try {
            boolean b = dB.delBook(bName);
            if (b){
                resp.sendRedirect("/2004220106LZY/manager.jsp?end=0");
            }else {
                resp.sendRedirect("/2004220106LZY/manager.jsp?end=1");
            }
        } catch (ClassNotFoundException |SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("/2004220106LZY/manager.jsp?end=1");
        }
    }
}
