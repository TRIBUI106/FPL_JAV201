package me.cz.fpl_jav201.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "lab1User")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {

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
