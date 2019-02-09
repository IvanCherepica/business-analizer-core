package servlet;

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


@WebServlet("/search/*")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Point> pointsAsked = new ArrayList<>();

        String userBusinessType = request.getParameter("businessType");

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

        JSONObject Jobject = new JSONObject(jsonData);
        JSONArray Jarray_feature = Jobject.getJSONArray("features");


        for (int i = 0; i < Jarray_feature.length(); i++) {

            JSONObject object_geom = Jarray_feature.getJSONObject(i);
            JSONArray Jarray_geom = object_geom.getJSONArray("geometries");
            JSONObject Jarray_prop = object_geom.getJSONObject("properties");

            String busName = Jarray_prop.getString("name");
            String busAddress = Jarray_prop.getJSONObject("CompanyMetaData").getString("address");

            for (int j = 0; j < Jarray_geom.length(); j++) {

                JSONObject coord = Jarray_geom.getJSONObject(j);
                JSONArray Jarray_coord = coord.getJSONArray("coordinates");

                float longitude = Jarray_coord.getFloat(0);
                float latitude = Jarray_coord.getFloat(1);

                pointsAsked.add(new Point(busName, busAddress, longitude, latitude, 2)); // 2 = АПТЕКИ

            }

        }
    }
}
