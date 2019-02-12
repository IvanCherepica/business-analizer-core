package servlet;

import model.Point;
import service.PointServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
@WebServlet("/admin/cafe")
public class AdminPointsCafeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");

        PointServiceImpl pointService = new PointServiceImpl();

        List <Point> points = pointService.getByBizType(1);

        request.setAttribute("points", points);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_points_cafe.jsp");
        dispatcher.forward(request, response);
    }
}
