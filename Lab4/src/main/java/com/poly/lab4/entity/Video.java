package com.poly.lab4.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "Videos")
public class Video {

    @Id
    @Column(name = "id")
    private String id;

    @Column(name = "title")
    private String title;

    @Column(name = "description")
    private String description;

    @Column(name = "active")
    private Boolean active;

    public Video() {
    }

    public Video(String id, String title, String description, Boolean active) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.active = active;
    }
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }
}
