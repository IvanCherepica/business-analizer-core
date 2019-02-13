package servlet;


import model.BizType;
import service.BizTypeServiceImpl;
import service.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/user/map")
public class MapServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");

        Service<BizType> bizTypeService= new BizTypeServiceImpl();
        List<BizType> bizTypes = bizTypeService.getAll();
        request.setAttribute("bizTypes", bizTypes);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/map.jsp");
        dispatcher.forward(request, response);
    }
}
