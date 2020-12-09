CREATE TABLE member (
    memberid VARCHAR2(50) PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    password VARCHAR2(30) NOT NULL,
    regdate DATE NOT NULL
);

SELECT * FROM member;