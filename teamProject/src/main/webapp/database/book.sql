use book;

-- 유저에 대한 정보 테이블 
create table users(
    id int primary key,
	userId varchar(20) unique not null,
    userPw varchar(20) not null,
    `name` varchar(20) not null,
    mobile varchar(13) not null
);

-- 찜한 책 목록 테이블 
create table dibsBook(
	id int,
    isbn varchar(30) primary key,
    createAt datetime,
    foreign key (id) references users(id)
);

-- 유저들이 읽은 책의 정
create table myLibrary(
	id int,										-- 유저의 코
	isbn varchar(30),							-- 내가 읽은 책의 isbn
	modifiedAt datetime,						-- 수정 시간 
	foreign key (isbn) references dibsBook(isbn),
	foreign key (id) references users(id)
);

-- best_seller 에 대한 dummy data
create table best_book(
    sbn varchar(30) primary key	-- best_seller 책 dummy data
);

-- new_book 에 대한 dummy data
create table new_book(
isbn varchar(30)
);

-- 리뷰 게시판에 대한 정보 테이
create table board(
    id int,							-- 책 코드 자동증
    userId int,						-- 리뷰 쓴 회원의 아이디 (해당유저의 코드를 줘도 상관 없을 듯 )
    isbn varchar(30),				-- 해당 책의 isbn
    contents varchar(2000) not null,-- 리뷰 내용
    createdAt datetime
);

--drop database book;