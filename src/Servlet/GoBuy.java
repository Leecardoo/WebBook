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

@WebServlet(name = "GoBuy",value = "/servlet/goBuy")
public class GoBuy extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookName = req.getParameter("bookName");
        float bookPress = Float.parseFloat(req.getParameter("bookPress"));
        int bookCount = Integer.parseInt(req.getParameter("count"));
        HttpSession session = req.getSession();
        ArrayList books = (ArrayList) session.getAttribute("books");
        if (books == null) {
            books = new ArrayList();
            session.setAttribute("books", books);
        }
        if (books.size() != 0) {
            for (int j=0; j<books.size();j++){
                boolean resault = true;
            for (int i = 0; i < books.size(); i++) {
                Book_VO book_vo = (Book_VO) books.get(i);
                if (book_vo.getBookName().equals(bookName)) {
                    book_vo.setBookCount(bookCount + book_vo.getBookCount());
                    resault=false;
                    resp.sendRedirect("/2004220106LZY/store.jsp");
                    break;
                }
            }
            if (!resault){
                break;
            }
            if (resault) {
                    Book_VO book_vo_s = new Book_VO();
                    book_vo_s.setBookName(bookName);
                    book_vo_s.setBookPress(bookPress);
                    book_vo_s.setBookCount(bookCount);
                    books.add(book_vo_s);
                    resp.sendRedirect("/2004220106LZY/store.jsp");
                    break;
                }
            }
        } else {
            Book_VO book_vo_s = new Book_VO();
            book_vo_s.setBookName(bookName);
            book_vo_s.setBookPress(bookPress);
            book_vo_s.setBookCount(bookCount);
            books.add(book_vo_s);
            resp.sendRedirect("/2004220106LZY/store.jsp");
        }
    }
}
