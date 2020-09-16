drop table movie;
-- 테이블 생성
create table movie(
movie_no number,
movieNm varchar2(100),
director varchar2(50),
genre varchar2(100),
actor varchar2(150),
openDt varchar2(50),
img varchar2(500)
);


--상영작
select * from screen;

--영화 DB
select * from movie;

-- 영화 시퀀스 생성
CREATE SEQUENCE movie_seq
START WITH 1
INCREMENT BY 1;

-- 상영작 시퀀스 생성
CREATE SEQUENCE screen_seq
START WITH 1
INCREMENT BY 1;


drop sequence seq_bbs_no;