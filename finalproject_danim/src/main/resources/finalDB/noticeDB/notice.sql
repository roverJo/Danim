drop sequence notice_no_seq;
create sequence notice_no_seq nocache;

drop table notice; cascade constraint;
create table notice(
	notice_no number primary key,
	timePosted date not null,
	title varchar2(100) not null,
	content clob not null,
	id varchar2(100) not null,
	constraint fk_notice_id foreign key(id) references member(id)
)

insert into notice(notice_no,timePosted,title,content,id) 
values(notice_no_seq.nextval,sysdate,'ooo','sss','admin');

select * from notice;

------------------------------------------------------------------

select notice_no,timePosted,title,content,id from notice;

select n.notice_no,n.title,to_char(n.timePosted,'YYYY.MM.DD HH:mm:ss') as timePosted,
n.content,m.id,m.nickname from notice n,member m 
where n.id=m.id and notice_no=1

select n.notice_no,n.timePosted,n.title,n.id,m.nickname from (
select notice_no,timePosted,title,ceil(rownum/5) as page,id from (
select notice_no,title,to_char(timePosted,'YYYY.MM.DD') as timePosted,
id from notice order by notice_no desc)) 
n,member m where n.id=m.id and page=1

select count(*) from notice

