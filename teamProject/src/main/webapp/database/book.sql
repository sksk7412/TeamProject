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

CREATE TABLE best_book
  (
     isbn VARCHAR(30) PRIMARY KEY
  );

CREATE TABLE new_book
  (
     isbn VARCHAR(30) PRIMARY KEY
  );
  
  CREATE TABLE dibsbook(
     id       INT,
     isbn     VARCHAR(30) PRIMARY KEY,
     createat DATETIME,
     FOREIGN KEY (id) REFERENCES users(id)
     );
     
CREATE TABLE myLibrary
  (
     userId     VARCHAR(20) not null,
     isbn       VARCHAR(30),
     isReviewed TINYINT DEFAULT 0,
     FOREIGN KEY (userId) REFERENCES users(userId)
  );
  
  CREATE TABLE board
  (
     id        INT PRIMARY KEY,
     userid    VARCHAR(20) NOT NULL,
     isbn      VARCHAR(30) NOT NULL,
     contents  VARCHAR(2000) NOT NULL,
     createdAt DATETIME,
     modifiedAt DATETIME,
     FOREIGN KEY (userid) REFERENCES users(userId)
  ); 