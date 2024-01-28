create table book (
	book_id int auto_increment primary key,
    title varchar(100) not null,
    pubs varchar(100),
    pub_date datetime,
    author_id int,
    constraint book_fk foreign key (author_id)
    references author(author_id)
);

insert into book (title, pubs, pub_date, author_id)
values ('우리들의 일그러진 영웅','다림','1998-02-22',1);

insert into book (title, pubs, pub_date, author_id)
values ('삼국지','민음사','2002-03-01',1);

insert into book (title, pubs, pub_date, author_id)
values ('토지','마로니에북스','2012-08-15',2);

insert into book (title, pubs, pub_date, author_id)
values ('유시민의 글쓰기 특강','생각의길','2015-04-01',3);

insert into book (title, pubs, pub_date, author_id)
values ('패션왕','중앙북스','2012-02-22',4);

insert into book (title, pubs, pub_date, author_id)
values ('순정만화','재미주의','2011-08-03',5);

insert into book (title, pubs, pub_date, author_id)
values ('오직두사람','문학동네','2017-05-04',6);

insert into book (title, pubs, pub_date, author_id)
values ('26년','재미주의','2012-02-04',5);

select *
from book;


create table author(
    author_id int auto_increment primary key,
    author_name varchar(100) not null,
    author_desc varchar(500)
);

insert into author (author_name, author_desc)
values ('이문열','경북 영양');

insert into author (author_name, author_desc)
values ('박경리','경상남도 통영');

insert into author (author_name, author_desc)
values ('유시민','17대 국회의원');

insert into author (author_name, author_desc)
values ('기안84','기안동에서 산 84년생');

insert into author (author_name, author_desc)
values ('강풀','온라인 만화가 1세대');

insert into author (author_name, author_desc)
values ('김영하','알쓸신잡');

delete from author
where author_id = 8;

drop table author; #잘못 넣어서 테이블 둘다 삭제했었음

select *
from author;

select b.book_id,
       b.title,
       b.pubs,
       b.pub_date,
       b.author_id,
       a.author_name,
       a.author_desc
from book b, author a
where b.author_id = a.author_id
order by book_id asc;

#강풀의 author_desc 정보를 ‘서울특별시’ 로 변경해 보세요

update author
set author_name = '강풀',
	author_desc = '서울특별시'
where author_id = 5;

#author 테이블에서 기안84 데이터를 삭제해 보세요 → 삭제 안됨

delete from book
where author_id = 4; #book_id로 고치고 5번을 했어야했는데 author_id 4번으로 잘못쳤는데 우연히됨

delete from author
where author_id = 4;

select *
from book;

select *
from author;