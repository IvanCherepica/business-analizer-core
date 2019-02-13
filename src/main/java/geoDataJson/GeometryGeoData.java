package geoDataJson;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import java.util.List;

public class GeometryGeoData {
    private String type = "Polygon";
    private static final Gson gson = new Gson();

    private List<List<List<Double>>> coordinates;

    public GeometryGeoData(String coordinatesLine) {
        Type listType = new TypeToken<List<List<List<Double>>>>() {}.getType();
        this.coordinates = gson.fromJson(coordinatesLine, listType);
    }
}
