package model;

import com.google.gson.Gson;
import com.google.gson.annotations.SerializedName;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "district")
public class District {

    @Id
    @Column(name = "id", unique = true)
    @SerializedName("id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "name")
    @SerializedName("name")
    private String name;

    @Column(name = "population")
    @SerializedName("population")
    private int population;

    @Column(name = "area")
    @SerializedName("area")
    private double area;

    @Column(name = "coordinates")
    @SerializedName("coordinates")
    private String coordinates;

    public District() {};

    public District(String name, int population, double area, String coordinates) {
        this.name = name;
        this.population = population;
        this.area = area;
        this.coordinates = coordinates;
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

    public int getPopulation() {
        return population;
    }

    public void setPopulation(int population) {
        this.population = population;
    }

    public double getArea() {
        return area;
    }

    public void setArea(double area) {
        this.area = area;
    }

    public String getCoordinates() {
        return coordinates;
    }

    public void setCoordinates(String coordinates) {
        this.coordinates = coordinates;
    }
}
