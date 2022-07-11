create database book;

use book;

create table myLibrary(
	title varchar(500) not null,
    thumbnail varchar(500) not null,
    isbn varchar(20) primary key,
    id int,
    authors varchar(20) not null,
    contents varchar(2000) not null,
    modifiedAt datetime,
	foreign key (title) references dibsBook(title),
    foreign key (thumbnail) references dibsBook(thumbnail),
    foreign key (isbn) references dibsBook(isbn),
    foreign key (id) references users(id),
    foreign key (authors) references dibsBook(authors)    
);


select * from myLibrary;