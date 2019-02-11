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
@WebServlet("/admin/beauty")
public class BeautyServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");
        List<Point> bpoints = new LinkedList<>();

        bpoints.add(new Point("Crop", "ул. Чехова, 9",59.915585,30.317665,3));
        bpoints.add(new Point("12 месяцев", "Владимирский просп., 19, ТК Владимирский пассаж, эт. 4",59.916293, 30.320225,3 ));
        bpoints.add(new Point("Waxabar", "ул. Марата, 77",59.914669, 30.321186,3 ));
        bpoints.add(new Point("You New","Итальянская ул., 31",59.908638, 30.322031,3 ));
        bpoints.add(new Point("Chic Nail","ул. Жуковского, 14",59.936341, 30.322866,3 ));
        bpoints.add(new Point("Галька и галыш", "Гродненский пер., 12-14",59.934592, 30.334778,2 ));

        request.setAttribute("points", bpoints);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/beauty.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");

        PointServiceImpl pointService = new PointServiceImpl();

        List <Point> bpoints = pointService.getByBizType(3);

        request.setAttribute("points", bpoints);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/beauty.jsp");
        dispatcher.forward(request, response);
    }
}
