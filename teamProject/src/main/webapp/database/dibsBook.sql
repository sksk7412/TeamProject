create database book;

use book;
create table dibsBook(
	title varchar(500) not null,
    thumbnail varchar(500) not null,
    isbn varchar(20) primary key,
    usercode int,
    authors varchar(20) not null,
    createAt datetime,
    foreign key (usercode) references user(usercode)
);

select * from dibsBook;