package model;

import javax.persistence.*;

@Entity
@Table(name = "point")
public class Point {

    @Id
    @Column(name = "id", unique = true)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "addres")
    private String addres;

    @Column(name = "longitude")
    private long longitude;

    @Column(name = "latitude")
    private long latitude;

    @Column(name = "typeId")
    private int typeId;

    public Point() {
    }

    public Point(String name, String addres, long longitude, long latitude, int typeId) {
        this.setName(name);
        this.setAddres(addres);
        this.setLongitude(longitude);
        this.setLatitude(latitude);
        this.setTypeId(typeId);
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
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

    public long getLongitude() {
        return longitude;
    }

    public void setLongitude(long longitude) {
        this.longitude = longitude;
    }

    public long getLatitude() {
        return latitude;
    }

    public void setLatitude(long latitude) {
        this.latitude = latitude;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    @Override
    public String toString() {
        return "Point{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", addres='" + addres + '\'' +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                ", typeId=" + typeId +
                '}';
    }
}
