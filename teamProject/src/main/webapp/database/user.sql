create database book;

use book;
create table user(
	id varchar(20) unique not null,
    pw varchar(20) not null,
    `name` varchar(20) not null,
    usercode int primary key,
    mobile varchar(13) not null
);

select * from user;