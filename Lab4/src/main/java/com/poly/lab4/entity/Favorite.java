package com.poly.lab4.entity;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
@Table(name = "Favorites")
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
    private Date likeDate;
}

