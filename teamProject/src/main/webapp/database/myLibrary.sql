create database book;

use book;

create table myLibrary(
	title varchar(500) not null,
    thumbnail varchar(500) not null,
    isbn varchar(20),
    id int,
    authors varchar(20) not null,
    contents varchar(2000) not null,
    modifiedAt datetime,
    foreign key (isbn) references dibsBook(isbn),
    foreign key (id) references users(id)
);

insert into myLibrary values('��������','12345','0001',1,'�質��','�������� �Ϳ���.',"2022-07-11");


select * from myLibrary;