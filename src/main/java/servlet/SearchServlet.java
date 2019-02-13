package servlet;

import com.google.gson.Gson;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import dto.MapPointDTO;
import model.Point;
import org.json.JSONArray;
import org.json.JSONObject;
import service.BizTypeServiceImpl;
import service.PointServiceImpl;

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

        List<MapPointDTO> pointsAsked = new ArrayList<>();
        int bizTypeId;
        String bizType = null;
        String formType;
        BizTypeServiceImpl btService = new BizTypeServiceImpl();

        boolean isBizTypeFound = false;

        try {
           bizTypeId =Integer.parseInt(request.getParameter("type"));
           bizType = btService.get(bizTypeId).getName();
           isBizTypeFound = true;

            PointServiceImpl pointService = new PointServiceImpl();

            List<Point> pointListFromBase = pointService.getByBizType(bizTypeId);

            for (int i = 0; i < pointListFromBase.size(); i++) {

                Point newPoint = pointListFromBase.get(i);

                MapPointDTO dto = new MapPointDTO(newPoint);

                dto.setCoordinates(new double[]{newPoint.getLongitude(), newPoint.getLatitude()});

                pointsAsked.add(dto);
            }

       } catch (NumberFormatException e){
           bizTypeId = 6;
       }

        if (!isBizTypeFound) {
            try {
                formType = request.getParameter("formType");
                //formType = new String(request.getParameter("formType"));//.getBytes("ISO-8859-1"),"UTF-8");
                bizType = formType;
            } catch (NullPointerException e) {
                e.printStackTrace();
            }


            int maxNumberOfResults = 500;

            String url = "https://search-maps.yandex.ru/v1/?text=" + bizType + " Санкт Петербург|Питер|СПб&format=json&results=" + maxNumberOfResults + "&lang=ru_RU&apikey=c2c81851-dd41-473e-93e8-cf9ce455c58b";


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

                    Point newPoint = new Point(busName, busAddress, longitude, latitude, bizTypeId);

//                pointService.save(newPoint);

                    MapPointDTO dto = new MapPointDTO(newPoint);

                    dto.setCoordinates(new double[]{longitude, latitude});

                    pointsAsked.add(dto);


                }

            }
        }

        Gson gson = new Gson();

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        System.out.println(gson.toJson(pointsAsked));
        response.getWriter().write(gson.toJson(pointsAsked));

        //String toSend = gson.toJson(pointsAsked);

    }


}
