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

@WebServlet("/admin/business")
public class AdminBizTypeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");
        request.setCharacterEncoding("utf-8");

        Service<BizType> bizTypeService= new BizTypeServiceImpl();

        List<BizType> bizTypes = bizTypeService.getAll();

        request.setAttribute("bizTypes", bizTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_biztype.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");
        request.setCharacterEncoding("utf-8");

        Service<BizType> bizTypeService= new BizTypeServiceImpl();

        String name = request.getParameter("name");
        String searchTags = request.getParameter("searchTags");
        String link = request.getParameter("link");

        bizTypeService.save(new BizType(name, searchTags, link));

        response.sendRedirect("/admin/business");
    }
}
