drop table member cascade constraint;
create table member(
	id varchar2(100) primary key,
	password varchar2(100) not null,
	nickname varchar2(100) not null, 
	address varchar2(100) not null,
	email_add varchar2(100) not null,
	admin number default 0
)
select * from member
--초기관리자
insert into member(id,password,nickname,address,email_add,admin) values('admin','911107','관리자','판교 분당구','genie9324@gmail.com',99);
insert into member(id,password,nickname,address,email_add,admin) values('java','1234','아이유','판교 분당구','kosta@kosta.kosta',0);
insert into member(id,password,nickname,address,email_add,admin) values('test','1234','유재석','서울 강남구','moohan@kosta.com',0);

select id,password,nickname,address,email_add,admin from member