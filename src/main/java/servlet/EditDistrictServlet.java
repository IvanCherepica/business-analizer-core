package servlet;

import model.District;
import service.DistrictServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/districts/edit")
public class EditDistrictServlet extends HttpServlet {
    private DistrictServiceImpl districtService = new DistrictServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        long id = Long.parseLong(request.getParameter("id"));
        District district = districtService.get(id);

        request.setAttribute("district", district);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_districts_edit.jsp");
        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        long id = Long.parseLong(request.getParameter("id"));

        String name = request.getParameter("name");

        double longitude = Double.parseDouble(request.getParameter("longitude"));
        double latitude = Double.parseDouble(request.getParameter("latitude"));

        //districtService.update(id, new District(name, longitude, latitude));

        response.sendRedirect("/admin/districts");
    }
}
