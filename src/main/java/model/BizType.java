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

    @Column(name = "link")
    private String link;

    public BizType() {
    }

    public BizType(String name, String searchTags,String link) {
        this.setName(name);
        this.setSearchTags(searchTags);
        this.setLink(link);
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
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
