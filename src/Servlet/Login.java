package Servlet;

import JDBC.DAO.Login_dao;
import JDBC.VO.UserData;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "Login", value = "/servlet/Login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String account = request.getParameter("account");
        String password = request.getParameter("password");
        int loginUser = Integer.parseInt(request.getParameter("loginUser"));
        Login_dao login_dao =new Login_dao();
        try {
            UserData userData = login_dao.getUserData(account);
            if (userData.getAdmin()!=null&&userData.getPassword().equals(password) && userData.getPassword()!=null && userData.getPassword()!=""){
                HttpSession session = request.getSession();
                session.setAttribute("userData",userData);
                if (loginUser==1){
                    response.sendRedirect("/2004220106LZY/needInspect/manager.jsp");
                }else {
                    response.sendRedirect("/2004220106LZY/store.jsp");
                }
            }else {
                response.sendRedirect("/2004220106LZY/index_login.jsp?end=1");
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("/2004220106LZY/index_login.jsp?end=1");
        }
    }
}
