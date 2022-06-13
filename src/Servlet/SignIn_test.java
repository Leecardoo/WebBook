package Servlet;

import JDBC.DAO.CreateUserTable;
import JDBC.DAO.Register;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SignIn", value = "/servlet/SignInTest")
public class SignIn_test extends HttpServlet {
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
                CreateUserTable cut=new CreateUserTable();
                boolean createEnd = cut.createShoppingTrolley(account);
                if (createEnd){
                    response.sendRedirect("/2004220106LZY/SignIn.jsp?end=0");
                }else{
                    response.sendRedirect("/2004220106LZY/SignIn.jsp?end=1");
                }

            }else{
                response.sendRedirect("/2004220106LZY/SignIn.jsp?end=1");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("/2004220106LZY/SignIn.jsp?end=1");
        }
    }
}
