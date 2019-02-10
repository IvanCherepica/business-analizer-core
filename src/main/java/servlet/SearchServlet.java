package servlet;

import com.google.gson.Gson;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import model.Point;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Point> pointsAsked = new ArrayList<>();

        String userBusinessType = request.getParameter("type");

        int bizTypeId;

        switch (userBusinessType) {
            case "кафе":
                bizTypeId = 1;
                break;
            case "аптека":
                bizTypeId = 2;
                break;
            case "салон красоты":
                bizTypeId = 3;
                break;
            case "продукты":
                bizTypeId = 4;
                break;
            case "одежда":
                bizTypeId = 5;
                break;
            default:
                bizTypeId = 6;
                break;
        }

        // 1 = кафе
        // 2 = аптеки
        // 3 = салон красоты
        // 4 = продукты
        // 5 = одежда

        int maxNumberOfResults = 30;

        String url = "https://search-maps.yandex.ru/v1/?text=" + userBusinessType + ", Санкт-Петербург&format=json&results=" + maxNumberOfResults + "&type=biz&lang=ru_RU&apikey=c2c81851-dd41-473e-93e8-cf9ce455c58b";

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

                pointsAsked.add(new Point(busName, busAddress, longitude, latitude, bizTypeId));

            }

        }



        Gson gson = new Gson();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        System.out.println(gson.toJson(pointsAsked));
        response.getWriter().write(gson.toJson(pointsAsked));

        String toSend = gson.toJson(pointsAsked);

    }


}
