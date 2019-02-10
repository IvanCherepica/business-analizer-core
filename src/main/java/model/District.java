package model;

import javax.persistence.*;

@Entity
@Table(name = "district")
public class District {

    @Id
    @Column(name = "id", unique = true)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "coords")
    private String coords; // (JSON)

    public District() {
    }

    public District(String name, String coords) {
        this.setName(name);
        this.setCoords(coords);
    }

    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getCoords() {
        return coords;
    }

    public void setId(long id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setCoords(String coords) {
        this.coords = coords;
    }

    @Override
    public String toString() {
        return "District{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", coords='" + coords + '\'' +
                '}';
    }
}
