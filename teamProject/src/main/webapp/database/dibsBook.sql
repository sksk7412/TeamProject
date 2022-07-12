create database book;

use book;

create table dibsBook(
	id int,
    isbn varchar(30) primary key,
    createAt datetime,
    foreign key (id) references users(id)
);

insert into dibsBook values(1,"0001","2022-07-12");
insert into dibsBook values(1,"0002","2022-07-12");
insert into dibsBook values(1,"0003","2022-07-12");

select * from dibsBook;