create database book;

use book;
create table user(
	id varchar(20) unique not null,
    pw varchar(20) not null,
    `name` varchar(20) not null,
    usercode smallint(8) primary key,
    `point` int default 1000,
    address varchar(500)
);


select * from user;