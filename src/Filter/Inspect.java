package Filter;

import JDBC.VO.UserData;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
@WebFilter(filterName = "Inspect",value = "/needInspect/*")
public class Inspect implements Filter {
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse resp=(HttpServletResponse)servletResponse;
        HttpServletRequest req=(HttpServletRequest)servletRequest;
        HttpSession session=req.getSession();
        UserData userData = (UserData) session.getAttribute("userData");
        if (userData==null){
            resp.sendRedirect("/2004220106LZY/index_login.jsp");
        }
        filterChain.doFilter(servletRequest,servletResponse);
    }
}


