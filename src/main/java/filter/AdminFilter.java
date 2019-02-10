package filter;

import model.Admin;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*"})
public class AdminFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpSession session = ((HttpServletRequest) request).getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin != null && admin.getLogin()!=null && admin.getPassword()!=null) {
            chain.doFilter(request, response);
            return;
        } else{
            ((HttpServletResponse) response).sendRedirect("/user");
        }
    }

    @Override
    public void destroy() {
    }
}
