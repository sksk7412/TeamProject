create database book;

use book;

create table users(
    id int primary key,
	userId varchar(20) unique not null,
    userPw varchar(20) not null,
    `name` varchar(20) not null,
    mobile varchar(13) not null
);

<<<<<<< HEAD
insert into users(userId,userPw,`name`,mobile) values('a','1111','°¡³ª´Ù','010-1111-1111');
=======
insert into users(userId,userPw,`name`,mobile) values('a','1111','������','010-1111-1111');
>>>>>>> refs/remotes/origin/#04_dongho

select * from users;