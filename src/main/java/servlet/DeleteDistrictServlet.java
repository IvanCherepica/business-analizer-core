package servlet;

import service.DistrictServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/districts/delete")
public class DeleteDistrictServlet extends HttpServlet {

    private DistrictServiceImpl districtService = new DistrictServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        long id = Long.parseLong(request.getParameter("id"));
        districtService.remove(id);

        response.sendRedirect("/admin/districts");
    }
}
