
drop table movie;
drop table screen;
drop table movie_member;
drop table movie_grade;
drop table movie_note;
drop sequence movie_seq;
drop sequence screen_seq;
drop sequence grade_seq;
drop sequence note_seq;

-- ���̺� ����
-- ��ȭ ���̺� ����
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

-- ���� ���̺� ����
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

-- ȸ�� ���̺� ����
create table movie_member(
id varchar2(50),
pw varchar2(50) not null,
nick varchar2(50),
genre varchar2(200),
constraint movie_member_id_pk primary key(id)
);

-- ���� ���̺� ����
create table movie_grade(
grade_no number,
id varchar2(50) not null,
movienm varchar2(200) not null,
grade number,
constraint movie_grade_no_pk primary key(grade_no),
constraint mem_grade_id_fk1 foreign key(id) references movie_member(id),
constraint movie_grade_movienm_fk2 foreign key(movienm) references movie(movienm)
);

-- ��ȭ ������ ����
create table movie_note(
note_no number,
id varchar2(50),
movienm varchar2(200),
note varchar2(500),
constraint movie_note_no_pk primary key(note_no),
constraint mem_note_id_fk1 foreign key(id) references movie_member(id),
constraint movie_note_movienm_fk2 foreign key(movienm) references movie(movienm)
);

-- ��ȭ ������ ����
CREATE SEQUENCE movie_seq
START WITH 1
INCREMENT BY 1;

-- ���� ������ ����
CREATE SEQUENCE screen_seq
START WITH 1
INCREMENT BY 1;

-- ���������� ������ ����
CREATE SEQUENCE comeoutmovie_seq
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
select * from MOVIE_NOTE;


--�� �ʿ��� ������ ���� (������ ���ҷ���)
delete from movie where movieNm like '%������%';
delete from movie where movieNm like '%�ٷ�ٷ�%';
delete from movie where movieNm like '�̻��� ����';

--------------------------------------------------------------------------------------------------------------------------------------
drop table movie_member;

create table movie_member(
	id varchar2(100),
	pw varchar2(100)
	
);

select * from movie_member;

insert into movie_member values('asdf','123');
insert into movie_member values('qwe','qwe');
