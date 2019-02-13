package servlet;

import model.District;
import service.DistrictServiceImpl;
import service.Service;

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

        response.setContentType("text/html utf-8");
        request.setCharacterEncoding("utf-8");

        Service<District> districtService= new DistrictServiceImpl();

        long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        String crd = request.getParameter("crd");
        double area = Double.parseDouble(request.getParameter("area"));
        int population = Integer.parseInt(request.getParameter("population"));

        districtService.update(id, new District(name, population, area, crd));

        response.sendRedirect("/admin/districts");
    }
}
