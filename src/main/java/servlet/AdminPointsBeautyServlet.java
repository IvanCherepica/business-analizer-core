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
import java.util.List;
@WebServlet("/admin/point/beauty")
public class AdminPointsBeautyServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");

//        String url = request.getParameter("url");
//        StringBuffer url = request.getRequestURL();
//        String link = url.substring(url.indexOf("/admin/point/")+13);

        BizTypeServiceImpl bizTypeService = new BizTypeServiceImpl();
        List<BizType> bizTypeList = bizTypeService.getAll();
        request.setAttribute("biztypes",bizTypeList);//для динамической отрисовки кнопок

        PointServiceImpl pointService = new PointServiceImpl();
        List <Point> bpoints = pointService.getByBizType(3L);
        request.setAttribute("points", bpoints);



        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_points_beauty.jsp");
        dispatcher.forward(request, response);
    }
}
