create database book;

use book;

create table dibsBook(
	id int,
    isbn varchar(30) primary key,
    createAt datetime,
    foreign key (id) references users(id)
);

  

select * from dibsBook;
