drop table movie;
drop table screen;
drop table movie_member;
drop table movie_grade;
drop table movie_note;
drop sequence movie_seq;
drop sequence screen_seq;
drop sequence grade_seq;

-- ���̺� ����
create table movie(
movie_no number primary key,
movieNm varchar2(100),
director varchar2(50),
genre varchar2(100),
actor varchar2(150),
openDt varchar2(50),
img varchar2(500)
);

create table screen(
movie_no number primary key,
movieNm varchar2(100),
director varchar2(50),
genre varchar2(100),
actor varchar2(150),
openDt varchar2(50),
img varchar2(500)
);

create table movie_member(
id varchar2(50) primary key,
pw varchar2(50),
nick varchar2(50),
genre varchar2(100)
);

create table movie_grade(
grade_no number primary key,
id varchar2(50),
movienm varchar2(100),
grade number,
note varchar2(200)
);

create table movie_note(
note_no number primary key,
id varchar2(50),
movienm varchar2(100),
note varchar2(500)
);

-- ��ȭ ������ ����
CREATE SEQUENCE movie_seq
START WITH 1
INCREMENT BY 1;

-- ���� ������ ����
CREATE SEQUENCE screen_seq
START WITH 1
INCREMENT BY 1;

-- ���� ������ ����
CREATE SEQUENCE grade_seq
START WITH 1
INCREMENT BY 1;

-- ������ ������ ����
CREATE SEQUENCE note_seq
START WITH 1
INCREMENT BY 1;

--����
select * from screen;
--��ȭ DB
select * from movie;
select * from MOVIE_MEMBER;
select * from MOVIE_GRADE;


