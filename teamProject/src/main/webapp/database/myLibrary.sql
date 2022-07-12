create database book;

use book;

create table myLibrary(
    isbn varchar(30),
    id int,
    modifiedAt datetime, 
    foreign key (isbn) references dibsBook(isbn),
    foreign key (id) references users(id)
); 

select * from myLibrary;