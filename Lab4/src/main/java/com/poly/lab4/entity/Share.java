package com.poly.lab4.entity;

import jakarta.persistence.*;

import java.sql.Date;

@Entity
@Table(name = "Shares")
public class Share {
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
    private Date shareDate;
}

