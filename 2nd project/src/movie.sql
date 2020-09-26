
drop table movie;
drop table screen;
drop table movie_member;
drop table movie_grade;
drop table movie_note;
drop sequence movie_seq;
drop sequence screen_seq;
drop sequence grade_seq;
drop sequence note_seq;

-- 테이블 생성
-- 영화 테이블 생성
create table movie(
movie_no number,
movieNm varchar2(200) not null,
director varchar2(100),
genre varchar2(150),
actor varchar2(150),
openDt varchar2(50),
img varchar2(500),
constraint movie_pk primary key(movie_no),
constraint movie_uq unique(movieNm)
);

-- 상영작 테이블 생성
create table screen(
movie_no number,
movieNm varchar2(200) not null,
director varchar2(100),
genre varchar2(150),
actor varchar2(150),
openDt varchar2(50),
img varchar2(500),
constraint screen_pk primary key(movie_no),
constraint movie_screen_name_fk1 foreign key(movieNm) references movie(movieNm)
);

create table comeoutmovie(
movie_no number,
movieNm varchar2(200) not null,
director varchar2(100),
genre varchar2(150),
actor varchar2(150),
openDt varchar2(50),
img varchar2(500),
constraint comeoutmovie_pk primary key(movie_no)
);

-- 회원 테이블 생성
create table movie_member(
id varchar2(50),
pw varchar2(50) not null,
nick varchar2(50),
genre varchar2(200),
constraint movie_member_id_pk primary key(id)
);

-- 평점 테이블 생성
create table movie_grade(
grade_no number,
id varchar2(50) not null,
movienm varchar2(200) not null,
grade number,
constraint movie_grade_no_pk primary key(grade_no),
constraint mem_grade_id_fk1 foreign key(id) references movie_member(id),
constraint movie_grade_movienm_fk2 foreign key(movienm) references movie(movienm)
);

-- 영화 한줄평 생성
create table movie_note(
note_no number,
id varchar2(50),
movienm varchar2(200),
note varchar2(500),
constraint movie_note_no_pk primary key(note_no),
constraint mem_note_id_fk1 foreign key(id) references movie_member(id),
constraint movie_note_movienm_fk2 foreign key(movienm) references movie(movienm)
);

-- 영화 시퀀스 생성
CREATE SEQUENCE movie_seq
START WITH 1
INCREMENT BY 1;

-- 상영작 시퀀스 생성
CREATE SEQUENCE screen_seq
START WITH 1
INCREMENT BY 1;

-- 개봉예정작 시퀀스 생성
CREATE SEQUENCE comeoutmovie_seq
START WITH 1
INCREMENT BY 1;

-- 평점 시퀀스 생성
CREATE SEQUENCE grade_seq
START WITH 1
INCREMENT BY 1;

-- 한줄평 시퀀스 생성
CREATE SEQUENCE note_seq
START WITH 1
INCREMENT BY 1;


--상영작
select * from screen;
--영화 DB
select * from movie;
select * from MOVIE_MEMBER;
select * from MOVIE_GRADE;
select * from MOVIE_NOTE;


--불 필요한 데이터 삭제 (사진을 못불러옴)
delete from movie where movieNm like '%극장판%';
delete from movie where movieNm like '%꾸루꾸루%';
delete from movie where movieNm like '이상한 게임';

--------------------------------------------------------------------------------------------------------------------------------------
drop table movie_member;

create table movie_member(
	id varchar2(100),
	pw varchar2(100)
	
);

select * from movie_member;

insert into movie_member values('asdf','123');
insert into movie_member values('qwe','qwe');
