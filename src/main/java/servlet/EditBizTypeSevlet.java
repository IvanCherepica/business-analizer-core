package servlet;

import model.BizType;
import service.BizTypeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/business/edit")
public class EditBizTypeSevlet extends HttpServlet {
    private BizTypeServiceImpl bizTypeService = new BizTypeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        long id = Long.parseLong(request.getParameter("id"));
        BizType bizType = bizTypeService.get(id);

        request.setAttribute("bizType", bizType);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_biztype_edit.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        bizTypeService.update(id, new BizType(name));

        response.sendRedirect("/admin/business");
    }
}