package servlet;

import model.Point;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import service.PointServiceImpl;
import util.DBHelper;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

import static util.DBHelper.createSessionFactory;

@WebServlet("/admin")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");
        request.setCharacterEncoding("utf-8");

        PointServiceImpl pointService = new PointServiceImpl();

        List<Point> pointList = new ArrayList<>();

        pointList.add(new Point("Ozerki","Moscovskiy prosp 25/1",59.915585,30.317665,2));
        pointList.add(new Point("Озерки","Московский просп., 25/1",59.915585,30.317665,2));
        pointList.add(new Point("ГорЗдрав","Бронницкая ул., 5",59.916293, 30.320225,2 ));
        pointList.add(new Point("Софосбувир СПб", "Клинский просп., 21",59.914669, 30.321186,2 ));
        pointList.add(new Point("Синофарм СПб Китайская медицина","наб. Обводного канала, 92, эт. 1, оф. 102-2",59.908638, 30.322031,2));
        pointList.add(new Point("Петрофарм","Большая Конюшенная ул., 14",59.936341, 30.322866,2));
        pointList.add(new Point("Петербургские аптеки", "Невский просп., 50",59.934592, 30.334778,2));


        pointService.saveList(pointList);

        List <Point> points = pointService.getAll();

        request.setAttribute("points", points);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.jsp");
        dispatcher.forward(request, response);

    }
}
