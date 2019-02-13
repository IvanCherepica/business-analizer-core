package geoDataJson;

public class FeatureGeoData {
    public FeatureGeoData(long id, PropertiesGeoData properties, GeometryGeoData geometry) {
        this.id = id;
        this.properties = properties;
        this.geometry = geometry;
    }

    private final String type = "Feature";
    private long id;
    private PropertiesGeoData properties;
    private GeometryGeoData geometry;
}
