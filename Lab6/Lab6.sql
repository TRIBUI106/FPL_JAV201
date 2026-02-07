create database Lab6

create table Users
(
    id       int auto_increment
        primary key,
    username varchar(255) not null,
    password varchar(255) not null,
    fullname varchar(255) null,
    email    varchar(255) null,
    role     int          null,
    constraint username
        unique (username)
);

