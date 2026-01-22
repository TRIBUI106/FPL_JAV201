create table users
(
    id       int auto_increment
        primary key,
    email    varchar(100)                 not null,
    password varchar(100)                 null,
    fullname varchar(100) charset utf8mb3 null,
    admin    bit                          null,
    constraint email
        unique (email)
);

create table videos
(
    id          int auto_increment
        primary key,
    title       varchar(200) charset utf8mb3 null,
    poster      varchar(200)                 null,
    views       int                          null,
    description varchar(500) charset utf8mb3 null
);

create table favorites
(
    id        int auto_increment
        primary key,
    user_id   int  null,
    video_id  int  null,
    like_date date null,
    constraint user_id
        unique (user_id, video_id),
    constraint favorites_ibfk_1
        foreign key (user_id) references users (id),
    constraint favorites_ibfk_2
        foreign key (video_id) references videos (id)
);

create index video_id
    on favorites (video_id);

