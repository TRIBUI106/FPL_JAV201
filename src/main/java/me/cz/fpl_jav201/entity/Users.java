package me.cz.fpl_jav201.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "lab1User")
public class Users {

    @Id
    @Column(name = "id")
    String id;

    @Column(name = "password")
    String password;

    @Column(name = "fullname")
    String fullname;

    @Column(name = "email")
    String email;

    @Column(name = "isAdmin")
    boolean isAdmin = false;

}
