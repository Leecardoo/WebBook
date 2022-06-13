package Servlet;

import JDBC.DAO.CreateUserTable;
import JDBC.DAO.Register;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SignIn", value = "/servlet/SignIn")
public class SignIn extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        String nickname = request.getParameter("nickname");
        Register register=new Register();
        try {
            boolean b = register.signIn(account, password, nickname);
            if (b){
                response.sendRedirect("/2004220106LZY/index_SignIn.jsp?end=0");
            }else{
                response.sendRedirect("/2004220106LZY/index_SignIn.jsp?end=1");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("/2004220106LZY/index_SignIn.jsp?end=1");
        }
    }
}
