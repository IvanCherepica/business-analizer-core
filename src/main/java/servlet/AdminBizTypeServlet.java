package servlet;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import model.BizType;
import model.Point;
import org.json.JSONArray;
import org.json.JSONObject;
import service.BizTypeServiceImpl;
import service.PointServiceImpl;
import service.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/business")
public class AdminBizTypeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");
        request.setCharacterEncoding("utf-8");

        Service<BizType> bizTypeService= new BizTypeServiceImpl();

        List<BizType> bizTypes = bizTypeService.getAll();

        request.setAttribute("bizTypes", bizTypes);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_biztype.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html utf-8");
        request.setCharacterEncoding("utf-8");

        Service<BizType> bizTypeService= new BizTypeServiceImpl();

        String name = request.getParameter("name");
        String searchTags = request.getParameter("searchTags");
        String link = request.getParameter("link");
        BizType bizType = new BizType(name, searchTags, link);

        bizTypeService.save(bizType);
        Long id = bizType.getId();



        //Обновляем список поинтов по данному типу bizType.id
        PointServiceImpl pointService = new PointServiceImpl();
        List<Point> pointListToRemove = pointService.getByBizType(id);

        pointService.removeList(pointListToRemove);

        List<Point> newPointList = new ArrayList<>();

        int maxNumberOfResults = 500;

        String url = "https://search-maps.yandex.ru/v1/?text=" + searchTags + "&format=json&results=" + maxNumberOfResults + "&ll=30.30557800,59.91807704&spn=0.45,0.29&lang=ru_RU&apikey=c2c81851-dd41-473e-93e8-cf9ce455c58b";

        OkHttpClient client = new OkHttpClient();
        Request requestHttp = new Request.Builder()
                .url(url)
                .build();
        Response responses = null;

        try {
            responses = client.newCall(requestHttp).execute();
        } catch (IOException e) {
            e.printStackTrace();
        }

        String jsonData = null;

        try {
            jsonData = responses.body().string();
        } catch (IOException e) {
            e.printStackTrace();
        }

        JSONObject jsonObject = new JSONObject(jsonData);
        JSONArray jarrayFeature = jsonObject.getJSONArray("features");

        for (int i = 0; i < jarrayFeature.length(); i++) {

            JSONObject objectGeom = jarrayFeature.getJSONObject(i);
            JSONArray jarrayGeom = objectGeom.getJSONArray("geometries");
            JSONObject jarrayProp = objectGeom.getJSONObject("properties");

            String busName = jarrayProp.getString("name");
            String busAddress = jarrayProp.getJSONObject("CompanyMetaData").getString("address");

            for (int j = 0; j < jarrayGeom.length(); j++) {

                JSONObject coord = jarrayGeom.getJSONObject(j);
                JSONArray jarrayCoord = coord.getJSONArray("coordinates");

                Double longitude = jarrayCoord.getDouble(0);
                Double latitude = jarrayCoord.getDouble(1);

                Point newPoint = new Point(busName, busAddress, longitude, latitude, bizType);

                newPointList.add(newPoint);
            }
        }
        pointService.saveList(newPointList);




        response.sendRedirect("/admin/business");
    }
}
