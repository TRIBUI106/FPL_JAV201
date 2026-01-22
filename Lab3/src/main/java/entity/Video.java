package entity;


import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "videos")
public class Video {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String title;
    private String poster;
    private Integer views;
    private String description;

    @OneToMany(mappedBy = "video")
    private List<Favorite> favorites;

    public Video(Integer id, String title, String poster, Integer views, String description, List<Favorite> favorites) {
        this.id = id;
        this.title = title;
        this.poster = poster;
        this.views = views;
        this.description = description;
        this.favorites = favorites;
    }

    public Video() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPoster() {
        return poster;
    }

    public void setPoster(String poster) {
        this.poster = poster;
    }

    public Integer getViews() {
        return views;
    }

    public void setViews(Integer views) {
        this.views = views;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<Favorite> getFavorites() {
        return favorites;
    }

    public void setFavorites(List<Favorite> favorites) {
        this.favorites = favorites;
    }

    // getter setter
}
