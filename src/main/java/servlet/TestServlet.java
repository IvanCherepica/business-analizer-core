package servlet;

import com.google.gson.Gson;
import model.Point;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/test")
public class TestServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Point> pointsAsked = new ArrayList<>();

        String userBusinessType = request.getParameter("type");

//        pointsAsked.add(new Point(userBusinessType, "ацуа", 11, 33, 1));
//        pointsAsked.add(new Point("dsa", userBusinessType, 22, 44, 1));

        Gson gson = new Gson();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        System.out.println(gson.toJson(pointsAsked));
        response.getWriter().write(gson.toJson(pointsAsked));
    }
}