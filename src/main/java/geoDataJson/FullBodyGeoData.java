package geoDataJson;

import java.util.List;

public class FullBodyGeoData {
    public FullBodyGeoData(List<FeatureGeoData> features) {
        this.features = features;
    }

    private final String type = "FeatureCollection";
    private List<FeatureGeoData> features;
}
