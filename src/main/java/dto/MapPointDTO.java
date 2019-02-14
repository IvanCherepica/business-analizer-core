package dto;

import model.BizType;
import model.Point;

public class MapPointDTO {

    private Long id;

    private String name;

    private String addres;

    private Double longitude;

    private Double latitude;

    private BizType typeId;

    private String type =  "Point";

    private Double[] coordinates;

    public MapPointDTO(Point point) {
        this.id = point.getId();
        this.name = point.getName();
        this.addres = point.getAddres();
        this.longitude = point.getLongitude();
        this.latitude = point.getLatitude();
        this.typeId = point.getBizType();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddres() {
        return addres;
    }

    public void setAddres(String addres) {
        this.addres = addres;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public BizType getTypeId() {
        return typeId;
    }

    public void setTypeId(BizType typeId) {
        this.typeId = typeId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double[] getCoordinates() {
        return coordinates;
    }

    public void setCoordinates(Double[] coordinates) {
        this.coordinates = coordinates;
    }
}
