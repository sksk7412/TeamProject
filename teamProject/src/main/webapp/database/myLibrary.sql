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

insert into myLibrary values('°­¾ÆÁö¶Ë','12345','0001',1,'±è³ª¿¬','°­¾ÆÁö´Â ±Í¿±´Ù.',"2022-07-11");


select * from myLibrary;