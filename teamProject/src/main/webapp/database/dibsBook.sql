create database book;

use book;

create table dibsBook(
    isbn varchar(30) primary key,
    id int,
    createAt datetime,
    foreign key (id) references users(id)
);

insert into dibsBook values("0001",1,"2022-07-12");
insert into dibsBook values("0002",1,"2022-07-12");
insert into dibsBook values("0003",1,"2022-07-12");

select * from dibsBook;