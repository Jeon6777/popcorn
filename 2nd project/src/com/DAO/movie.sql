drop table movie;
-- ���̺� ����
create table movie(
movie_no number,
movieNm varchar2(100),
director varchar2(50),
genre varchar2(100),
actor varchar2(150),
openDt varchar2(50),
img varchar2(500)
);


--����
select * from screen;

--��ȭ DB
select * from movie;

-- ��ȭ ������ ����
CREATE SEQUENCE movie_seq
START WITH 1
INCREMENT BY 1;

-- ���� ������ ����
CREATE SEQUENCE screen_seq
START WITH 1
INCREMENT BY 1;


drop sequence seq_bbs_no;