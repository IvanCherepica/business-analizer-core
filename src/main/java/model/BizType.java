package model;

import javax.persistence.*;

@Entity
@Table(name = "bizType")
public class BizType {

    @Id
    @Column(name = "id", unique = true)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "searchtags")
    private String searchTags;

    public BizType() {
    }

    public BizType(String name, String searchTags) {
        this.setName(name);
        this.setSearchTags(searchTags);
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

    public String getSearchTags() {
        return searchTags;
    }

    public void setSearchTags(String searchTags) {
        this.searchTags = searchTags;
    }
    
}
