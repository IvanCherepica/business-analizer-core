package servlet;

import model.Point;
import service.BizTypeServiceImpl;
import service.PointServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/admin/business/delete")
public class DeleteBizTypeServlet extends HttpServlet {

    private BizTypeServiceImpl bizTypeService = new BizTypeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {

        long id = Long.parseLong(request.getParameter("id"));

        //Удаляем список поинтов по данному типу bizType.id
        PointServiceImpl pointService = new PointServiceImpl();
        List<Point> pointListToRemove = pointService.getByBizType(id);
        pointService.removeList(pointListToRemove);

        bizTypeService.remove(id);

        response.sendRedirect("/admin/business");
    }
}
