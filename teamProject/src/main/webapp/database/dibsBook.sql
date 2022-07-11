create database book;

use book;
create table dibsBook(
	title varchar(500) not null,
    thumbnail varchar(500) not null,
    isbn varchar(20) primary key,
    usercode int,
    authors varchar(20),
    createAt datetime
);

select * from user;