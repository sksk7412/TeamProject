create database book;

use book;

create table myLibrary(
	id int,
    isbn varchar(30),
    modifiedAt datetime,
    foreign key (isbn) references dibsBook(isbn),
    foreign key (id) references users(id)
);

insert into myLibrary values(1,"8990982707 9788990982704","2022-07-11");
insert into myLibrary values(1,"1169180949 9791169180948","2022-07-11");

select * from myLibrary;