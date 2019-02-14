package servlet;

import model.BizType;
import model.Point;
import service.BizTypeServiceImpl;
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
@WebServlet("/admin/point/clothes")
public class AdminPointsСlothesServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");

        PointServiceImpl pointService = new PointServiceImpl();
        List <Point> points = pointService.getByBizType(5L);
        request.setAttribute("points", points);

        BizTypeServiceImpl bizTypeService = new BizTypeServiceImpl();
        List<BizType> bizTypeList = bizTypeService.getAll();
        request.setAttribute("biztypes",bizTypeList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_points_clothes.jsp");
        dispatcher.forward(request, response);
    }
}
