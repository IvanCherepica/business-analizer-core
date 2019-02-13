package servlet;

import com.google.gson.Gson;
import geoDataJson.FeatureGeoData;
import geoDataJson.FullBodyGeoData;
import geoDataJson.GeometryGeoData;
import geoDataJson.PropertiesGeoData;
import model.District;
import service.DistrictServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


@WebServlet("/districtsData")
public class GeoDataApiServlet extends HttpServlet {
    private final static Gson gson = new Gson();
    DistrictServiceImpl districtService = new DistrictServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<District> districts = districtService.getAll();
        PrintWriter out = resp.getWriter();
        resp.setContentType("application/json;charset=utf-8");

        List<FeatureGeoData> features = new ArrayList<>();
        for (District disrict: districts) {
            features.add(
                    new FeatureGeoData(disrict.getId(),
                            new PropertiesGeoData(disrict.getName(),
                                    disrict.getPopulation(),
                                    disrict.getArea()),
                            new GeometryGeoData(disrict.getCoordinates()))
            );
        }

        FullBodyGeoData fullBodyGeoData = new FullBodyGeoData(features);
        String jsonContent = gson.toJson(fullBodyGeoData);
        out.write(jsonContent);
        out.close();
    }

}
