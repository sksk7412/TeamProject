create database book;

use book;

create table dibsBook(
	title varchar(500) not null,
    thumbnail varchar(500) not null,
    isbn varchar(20) primary key,
    id int,
    authors varchar(20) not null,
    createAt datetime,
    foreign key (id) references users(id)
);

insert into dibsBook values('��������','12345','0001',1,'�質��',"2022-07-11");

select * from dibsBook;