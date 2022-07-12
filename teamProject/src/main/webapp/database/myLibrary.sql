create database book;

use book;

<<<<<<< HEAD
create table myLibrary(
	id int,
    isbn varchar(30),
    modifiedAt datetime,
    foreign key (isbn) references dibsBook(isbn),
    foreign key (id) references users(id)
);

insert into myLibrary values(1,"0001","2022-07-11");

select * from myLibrary;
=======
create table myLibrary(
	title varchar(500) not null,
    thumbnail varchar(500) not null,
    isbn varchar(20),
    id int,
    authors varchar(20) not null,
    contents varchar(2000) not null,

    
    create table myLibrary(
	id int,
    isbn varchar(30),
    modifiedAt datetime,
    foreign key (isbn) references dibsBook(isbn),
    foreign key (id) references users(id)
);

insert into myLibrary values(1,'0001',"2022-07-11");

select * from myLibrary;
>>>>>>> refs/remotes/origin/#04_dongho
