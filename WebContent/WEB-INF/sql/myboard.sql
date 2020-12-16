CREATE TABLE member (
    memberid VARCHAR2(50) PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    password VARCHAR2(30) NOT NULL,
    regdate DATE NOT NULL
);

SELECT * FROM member;

DROP TABLE article;
CREATE TABLE article (
    article_no NUMBER GENERATED AS IDENTITY,
    writer_id VARCHAR2(50) NOT NULL,
    writer_name VARCHAR2(50) NOT NULL,
    title VARCHAR2(255) NOT NULL,
    regdate DATE NOT NULL,
    moddate DATE NOT NULL,
    read_cnt NUMBER,
    PRIMARY KEY (article_no)
);

SELECT * FROM artice;

CREATE TABLE article_content (
    article_no NUMBER PRIMARY KEY,
    content VARCHAR2(4000)
);

SELECT * FROM article_content;

SELECT * FROM article
WHERE ROWNUM =1;

ALTER TABLE artice
RENAME TO article;

SELECT * FROM (SELECT * FROM member ORDER BY memberid DESC) WHERE ROWNUM = 1;

SELECT * FROM (SELECT * FROM article ORDER BY writer_id DESC) WHERE ROWNUM = 1;
SELECT * FROM article ORDER BY article_no;
SELECT * FROM article_content;
SELECT COUNT(*) FROM article;

INSERT INTO article (writer_id, writer_name, title, regdate, moddate, read_cnt) 
VALUES ('b' , 'b' , 'b' , SYSDATE, SYSDATE, 0);

commit;

SELECT * FROM article ORDER BY article_no DESC;

SELECT * FROM (SELECT article_no, title, ROW_NUMBER() 
                OVER (ORDER BY article_no DESC) rn 
                FROM article)
WHERE rn BETWEEN 1 AND 5;

SELECT rn, article_no, writer_id, writer_name, title, regdate, moddate, read_cnt FROM (SELECT article_no, writer_id, writer_name, title, regdate, moddate, read_cnt, ROW_NUMBER() OVER (ORDER BY article_no DESC) rn FROM article) WHERE rn  BETWEEN 1 AND 5;

SELECT * FROM (SELECT ROW_NUMBER() OVER (ORDER BY article_no DESC) rn, article_no, writer_id, writer_name, title, regdate, moddate, read_cnt FROM article) WHERE rn  BETWEEN 1 AND 5;

SELECT * FROM article ORDER BY article_no DESC OFFSET 6 ROWS FETCH FIRST 10 ROWS ONLY;

SELECT COUNT(*) FROM article;
SELECT ROW_NUMBER() OVER (ORDER BY article_no DESC) rs FROM article;

-- 댓글
DROP TABLE reply;
CREATE TABLE reply (
    replyid NUMBER GENERATED AS IDENTITY, 
    memberid VARCHAR2(50) NOT NULL,
    article_no NUMBER NOT NULL,
    body VARCHAR2(1000) NOT NULL,
    regdate DATE NOT NULL,
    PRIMARY KEY(replyid)
);

SELECT * FROM reply;

SELECT replyid, memberid, article_no, body, regdate
FROM reply
WHERE article_no=86
ORDER BY replyid DESC;
















