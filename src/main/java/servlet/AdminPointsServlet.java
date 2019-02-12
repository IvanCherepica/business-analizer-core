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
import java.util.*;

@WebServlet("/admin/points")
public class AdminPointsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");
        request.setCharacterEncoding("utf-8");

        PointServiceImpl pointService = new PointServiceImpl();

//        List<Point> pointList = new ArrayList<>();
//
//        pointList.add(new Point("Cafe","Moscovskiy prosp 25/1",59.915585,30.317665,1));
//        pointList.add(new Point("Super cafe","Moscovskiy prosp 25/1",59.915585,30.317665,1));
//
//        pointList.add(new Point("Ozerki","Moscovskiy prosp 25/1",59.915585,30.317665,2));
//        pointList.add(new Point("Ozerki2","Moscovskiy prosp 25/1",59.915585,30.317665,2));
////        pointList.add(new Point("Озерки","Московский просп., 25/1",59.915585,30.317665,2));
////        pointList.add(new Point("ГорЗдрав","Бронницкая ул., 5",59.916293, 30.320225,2 ));
////        pointList.add(new Point("Софосбувир СПб", "Клинский просп., 21",59.914669, 30.321186,2 ));
////        pointList.add(new Point("Синофарм СПб Китайская медицина","наб. Обводного канала, 92, эт. 1, оф. 102-2",59.908638, 30.322031,2));
////        pointList.add(new Point("Петрофарм","Большая Конюшенная ул., 14",59.936341, 30.322866,2));
////        pointList.add(new Point("Петербургские аптеки", "Невский просп., 50",59.934592, 30.334778,2));
//
//        pointList.add(new Point("Crop", "ул. Чехова, 9",59.915585,30.317665,3));
//        pointList.add(new Point("Waxabar", "ул. Марата, 77",59.914669, 30.321186,3 ));
//
//        pointList.add(new Point("Food","Moscovskiy prosp 25/1",59.915585,30.317665,4));
//        pointList.add(new Point("Super food","Moscovskiy prosp 25/1",59.915585,30.317665,4));
//
//
//        pointList.add(new Point("Clothes","Moscovskiy prosp 25/1",59.915585,30.317665,5));
//        pointList.add(new Point("Super Clothes","Moscovskiy prosp 25/1",59.915585,30.317665,5));
//
//        pointService.saveList(pointList);

        //List <Point> points = pointService.getAll();
        //По дефолту аптеки
        List <Point> points = pointService.getByBizType(2);

        request.setAttribute("points", points);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_points.jsp");
        dispatcher.forward(request, response);

    }
}
