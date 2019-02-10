package servlet;

import model.Point;

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
        bpoints.add(new Point("Crop", "ул. Чехова, 9",59915585,30317665,3));
        bpoints.add(new Point("12 месяцев", "Владимирский просп., 19, ТК Владимирский пассаж, эт. 4",59916293, 30320225,3 ));
        bpoints.add(new Point("Waxabar", "ул. Марата, 77",59914669, 30321186,3 ));
        bpoints.add(new Point("You New","Итальянская ул., 31",59908638, 30322031,3 ));
        bpoints.add(new Point("Chic Nail","ул. Жуковского, 14",59936341, 30322866,3 ));
        bpoints.add(new Point("Галька и галыш", "Гродненский пер., 12-14",59934592, 30334778,2 ));
        request.setAttribute("points", bpoints);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/beauty.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");
        List<Point> bpoints = new LinkedList<>();
        bpoints.add(new Point("Crop", "ул. Чехова, 9",59915585,30317665,3));
        bpoints.add(new Point("12 месяцев", "Владимирский просп., 19, ТК Владимирский пассаж, эт. 4",59916293, 30320225,3 ));
        bpoints.add(new Point("Waxabar", "ул. Марата, 77",59914669, 30321186,3 ));
        bpoints.add(new Point("You New","Итальянская ул., 31",59908638, 30322031,3 ));
        bpoints.add(new Point("Chic Nail","ул. Жуковского, 14",59936341, 30322866,3 ));
        bpoints.add(new Point("Галька и галыш", "Гродненский пер., 12-14",59934592, 30334778,2 ));
        request.setAttribute("points", bpoints);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/beauty.jsp");
        dispatcher.forward(request, response);
    }
}
