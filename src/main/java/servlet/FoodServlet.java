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

@WebServlet("/admin/food")
public class FoodServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");
//        List<Point> points = new LinkedList<>();
//        points.add(new Point("Озерки","Московский просп., 25/1",59915585,30317665,2));
//        points.add(new Point("ГорЗдрав","Бронницкая ул., 5",59916293, 30320225,2 ));
//        points.add(new Point("Софосбувир СПб", "Клинский просп., 21",59914669, 30321186,2 ));
//        points.add(new Point("Синофарм СПб Китайская медицина","наб. Обводного канала, 92, эт. 1, оф. 102-2",59908638, 30322031,2 ));
//        points.add(new Point("Петрофарм","Большая Конюшенная ул., 14",59936341, 30322866,2 ));
//        points.add(new Point("Петербургские аптеки", "Невский просп., 50",59934592, 30334778,2 ));

        PointServiceImpl pointService = new PointServiceImpl();

        List <Point> points = pointService.getByBizType(4);

        request.setAttribute("points", points);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/food.jsp");
        dispatcher.forward(request, response);
    }
}
