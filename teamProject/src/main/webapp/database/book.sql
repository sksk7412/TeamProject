USE book;

CREATE TABLE users
  (
     id     INT PRIMARY KEY,
     userid VARCHAR(20) UNIQUE NOT NULL,
     userpw VARCHAR(20) NOT NULL,
     `name` VARCHAR(20) NOT NULL,
     mobile VARCHAR(13) NOT NULL
  );

--insert into users(userId,userPw,`name`,mobile) values('a','1111','������','010-1111-1111');
CREATE TABLE dibsbook
  (
     id       INT,
     isbn     VARCHAR(30) PRIMARY KEY,
     createat DATETIME,
     FOREIGN KEY (id) REFERENCES users(id)
  );

CREATE TABLE myLibrary
  (
     id         INT not null primary key,
     isbn       VARCHAR(30),
     modifiedat DATETIME,
     FOREIGN KEY (id) REFERENCES users(id)
  );

--insert into myLibrary values(1,"0001","2022-07-11");
CREATE TABLE best_book
  (
     isbn VARCHAR(30) PRIMARY KEY
  );

CREATE TABLE new_book
  (
     isbn VARCHAR(30) PRIMARY KEY
  );

CREATE TABLE board
  (
     id        INT PRIMARY KEY,
     userid    INT,
     isbn      VARCHAR(30) NOT NULL,
     contents  VARCHAR(2000) NOT NULL,
     createdat DATETIME,
     FOREIGN KEY (isbn) REFERENCES mylibrary(isbn),
     FOREIGN KEY (userid) REFERENCES users(id)
  ); 