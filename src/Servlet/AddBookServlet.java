package Servlet;

import JDBC.DAO.AddBook;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AddBookServlet",value = "/servlet/AddBookServlet")
public class AddBookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bookName = request.getParameter("bookName");
        String author = request.getParameter("author");
        float press = Float.parseFloat(request.getParameter("press"));
        String bookImg = request.getParameter("bookImg");
        String bookIntro = request.getParameter("bookIntro");
        String authorIntro = request.getParameter("authorIntro");
        AddBook addBook=new AddBook();
        try {
            boolean add = addBook.add(bookName, author, press, bookImg, bookIntro, authorIntro);
            if (add){
                response.sendRedirect("/2004220106LZY/needInspect/addBook.jsp?end=0");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("/2004220106LZY/needInspect/addBook.jsp?end=1");
        }
    }
}
