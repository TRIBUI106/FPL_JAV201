package com.poly.lab5.entity;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "logs")
public class Log {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "url")
    private String url;

    @Column(name = "access_time")
    private LocalDateTime accessTime;

    @Column(name = "username")
    private String username;


    public Log() {}


    public int getId() {
        return id;
    }

    public String getUrl() {
        return url;
    }

    public LocalDateTime getAccessTime() {
        return accessTime;
    }

    public String getUsername() {
        return username;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setAccessTime(LocalDateTime accessTime) {
        this.accessTime = accessTime;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}


