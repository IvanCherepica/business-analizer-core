package model;

import javax.persistence.*;

@Entity
@Table(name = "bizType")
public class BizType {

    @Id
    @Column(name = "id", unique = true)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column(name = "name")
    private String name;

    public BizType() {}

    public BizType(String name) {
        this.setName(name);
    }

//    public BizType(long id, String name) {
//        this.setId(id);
//        this.setName(name);
//    }

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
}
