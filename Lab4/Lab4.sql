create table Users
(
    id       varchar(50)  not null
        primary key,
    email    varchar(100) null,
    password varchar(100) null,
    fullname varchar(100) null,
    constraint email
        unique (email)
);

create table Videos
(
    id          varchar(50)  not null
        primary key,
    title       varchar(255) null,
    description text         null,
    active      bit          null
);

create table Favorites
(
    id       int auto_increment
        primary key,
    user_id  varchar(50) null,
    video_id varchar(50) null,
    likeDate date        null,
    constraint Favorites_ibfk_1
        foreign key (user_id) references Users (id),
    constraint Favorites_ibfk_2
        foreign key (video_id) references Videos (id)
);

create index user_id
    on Favorites (user_id);

create index video_id
    on Favorites (video_id);

create table Shares
(
    id        int auto_increment
        primary key,
    user_id   varchar(50) null,
    video_id  varchar(50) null,
    shareDate date        null,
    constraint Shares_ibfk_1
        foreign key (user_id) references Users (id),
    constraint Shares_ibfk_2
        foreign key (video_id) references Videos (id)
);

create index user_id
    on Shares (user_id);

create index video_id
    on Shares (video_id);

