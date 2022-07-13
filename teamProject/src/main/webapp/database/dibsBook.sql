create database book;

use book;

create table dibsBook(
	id int,
    isbn varchar(30) primary key,
    createAt datetime,
    foreign key (id) references users(id)
<<<<<<< HEAD
<<<<<<< HEAD
);
  
insert into dibsBook values(1,"8990982707 9788990982704","2022-07-12");
insert into dibsBook values(1,"899098257X 9788990982575","2022-07-12");
insert into dibsBook values(1,"1136736697 9791136736697","2022-07-12");
insert into dibsBook values(1,"8901260719 9788901260716","2022-07-12");
insert into dibsBook values(1,"1169180949 9791169180948","2022-07-12");

select * from dibsBook;

=======
);

=======
);
>>>>>>> refs/remotes/origin/#02-NaYeon
  
insert into dibsBook values(1,"8990982707 9788990982704","2022-07-12");
insert into dibsBook values(1,"899098257X 9788990982575","2022-07-12");
insert into dibsBook values(1,"1136736697 9791136736697","2022-07-12");
insert into dibsBook values(1,"8901260719 9788901260716","2022-07-12");
insert into dibsBook values(1,"1169180949 9791169180948","2022-07-12");

<<<<<<< HEAD
select * from dibsBook;
>>>>>>> refs/remotes/origin/#04_dongho
=======
select * from dibsBook;
>>>>>>> refs/remotes/origin/#02-NaYeon
