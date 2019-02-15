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
@WebServlet("/admin/point")
public class AdminPointsServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");


        BizTypeServiceImpl bizTypeService = new BizTypeServiceImpl();
        List<BizType> bizTypeList = bizTypeService.getAll();
        request.setAttribute("biztypes",bizTypeList);//для динамической отрисовки кнопок

        PointServiceImpl pointService = new PointServiceImpl();
        Long typeId = Long.parseLong(request.getParameter("typeId"));
        if (typeId==0){ //если запрос пришел из admin_menu_entity.jsp, то открываем первый тип из листа
            typeId = bizTypeList.get(0).getId();
        }

        List <Point> bpoints = pointService.getByBizType(typeId);//фильтрация по типу
        request.setAttribute("points", bpoints);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_points.jsp");
        dispatcher.forward(request, response);
    }
}
