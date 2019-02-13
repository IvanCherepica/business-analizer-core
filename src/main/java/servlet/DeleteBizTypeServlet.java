package servlet;

import service.BizTypeServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/business/delete")
public class DeleteBizTypeServlet extends HttpServlet {

    private BizTypeServiceImpl bizTypeService = new BizTypeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        long id = Long.parseLong(request.getParameter("id"));
        bizTypeService.remove(id);

        response.sendRedirect("/admin/business");
    }
}
