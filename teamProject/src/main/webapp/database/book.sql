use book;

--create table users(
--    id int primary key,
--	userId varchar(20) unique not null,
--    userPw varchar(20) not null,
--    `name` varchar(20) not null,
--    mobile varchar(13) not null
--);
--insert into users(userId,userPw,`name`,mobile) values('a','1111','가나다','010-1111-1111');

--create table dibsBook(
--	id int,
--    isbn varchar(30) primary key,
--    createAt datetime,
--    foreign key (id) references users(id)
--);
    
--create table myLibrary(
--	id int,
--    isbn varchar(30),
--    modifiedAt datetime,
--    foreign key (isbn) references dibsBook(isbn),
--    foreign key (id) references users(id)
--);

--insert into myLibrary values(1,"0001","2022-07-11");
--
--insert into dibsBook values(1,"0001","2022-07-12");
--insert into dibsBook values(1,"0002","2022-07-12");
--insert into dibsBook values(1,"0003","2022-07-12");
--insert into dibsBook values(1,"0001","2022-07-12");
--insert into dibsBook values(1,"0002","2022-07-12");
--insert into dibsBook values(1,"0003","2022-07-12");
--
--select * from dibsBook;
--
--
--create table best_book(
--    isbn varchar(30) primary key
--);
--
--select * from myLibrary;
--
--insert into users(userId,userPw,`name`,mobile) values('a','1111','가나다','010-1111-1111');
--
--select * from users;
--drop database book;