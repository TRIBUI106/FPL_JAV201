create database Lab5
create table users
(
    username varchar(50)  not null
        primary key,
    password varchar(255) not null,
    fullname varchar(100) not null
);

create table logs
(
    id          int auto_increment
        primary key,
    url         varchar(255) null,
    access_time datetime     null,
    username    varchar(50)  null,
    constraint fk_logs_users
        foreign key (username) references users (username)
            on update cascade on delete set null
);

