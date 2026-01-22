package entity;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
@Table(
        name = "favorites",
        uniqueConstraints = @UniqueConstraint(columnNames = {"user_id", "video_id"})
)
public class Favorite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "video_id")
    private Video video;

    @Temporal(TemporalType.DATE)
    @Column(name = "like_date")
    private Date likeDate;

    public Favorite(Integer id, User user, Video video, Date likeDate) {
        this.id = id;
        this.user = user;
        this.video = video;
        this.likeDate = likeDate;
    }

    public Favorite() {

    }


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Video getVideo() {
        return video;
    }

    public void setVideo(Video video) {
        this.video = video;
    }

    public Date getLikeDate() {
        return likeDate;
    }

    public void setLikeDate(Date likeDate) {
        this.likeDate = likeDate;
    }
}

