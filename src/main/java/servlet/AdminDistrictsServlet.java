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
import java.util.List;

@WebServlet("/admin/districts")
public class AdminDistrictsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");
        request.setCharacterEncoding("utf-8");

        Service<District> districtService= new DistrictServiceImpl();

        List <District> districts = districtService.getAll();

        request.setAttribute("districts", districts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_districts.jsp");
        dispatcher.forward(request, response);
    }
}
