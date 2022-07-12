create database book;

use book;

create table myLibrary(
	id int,
    isbn varchar(30),
    modifiedAt datetime,
    foreign key (isbn) references dibsBook(isbn),
    foreign key (id) references users(id)
);

insert into myLibrary values(1,"0001","2022-07-11");

select * from myLibrary;