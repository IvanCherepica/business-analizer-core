package servlet;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import dto.MapPointDTO;
import model.BizType;
import model.Point;
import org.json.JSONArray;
import org.json.JSONObject;
import service.BizTypeServiceImpl;
import service.PointServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/business/edit")
public class EditBizTypeSevlet extends HttpServlet {
    private BizTypeServiceImpl bizTypeService = new BizTypeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        long id = Long.parseLong(request.getParameter("id"));
        BizType bizType = bizTypeService.get(id);

        request.setAttribute("bizType", bizType);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_biztype_edit.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        String tags = request.getParameter("searchTags");

        bizTypeService.update(id, new BizType(name));

        PointServiceImpl pointService = new PointServiceImpl();
        List<Point> pointListToRemove = pointService.getByBizType((int) id);

        //pointService.removeList(pointListToRemove);

        List<Point> newPointList = new ArrayList<>();

        int maxNumberOfResults = 500;

        String url = "https://search-maps.yandex.ru/v1/?text=" + tags + " Санкт Петербург|Питер|СПб&format=json&results=" + maxNumberOfResults + "&lang=ru_RU&apikey=c2c81851-dd41-473e-93e8-cf9ce455c58b";

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

        System.out.println(jsonData);

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

                float longitude = jarrayCoord.getFloat(0);
                float latitude = jarrayCoord.getFloat(1);

                Point newPoint = new Point(busName, busAddress, longitude, latitude, (int)id);

                newPointList.add(newPoint);
            }
        }

        //pointService.saveList(newPointList);

        response.sendRedirect("/admin/business");
    }
}