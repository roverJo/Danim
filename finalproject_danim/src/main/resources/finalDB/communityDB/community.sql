drop sequence comm_seq;
create sequence comm_seq nocache;

drop table community cascade constraint;
create table community(
	comm_no number primary key, 
	timePosted date not null,
	content clob not null,
	id varchar2(100) not null,
	constraint fk_comm_id foreign key(id) references member(id) on delete cascade
)

---------like table 추가(1차)---------
drop table commLike cascade constraint;
create table commLike(
	comm_no number,
	id varchar2(100),
	likePosted number default 0,
	constraint pk_commLike primary key(comm_no, id),
	constraint fk_commLike_id foreign key(id) references member(id) on delete cascade,
	constraint fk_commLike_community foreign key(comm_no) references community(comm_no) on delete cascade
)

-- community 게시판 table insert하고 select해서 확인해주세요
insert into community(comm_no,timePosted,content,id) values(comm_seq.nextval,sysdate,'안녕ㅎㅋ','admin');
insert into community(comm_no,timePosted,content,id) values(comm_seq.nextval,sysdate,'test1','admin');
insert into community(comm_no,timePosted,content,id) values(comm_seq.nextval,sysdate,'test2','admin');
insert into community(comm_no,timePosted,content,id) values(comm_seq.nextval,sysdate,'test3','test');
insert into community(comm_no,timePosted,content,id) values(comm_seq.nextval,sysdate,'test4','test');
insert into community(comm_no,timePosted,content,id) values(comm_seq.nextval,sysdate,'test5','test');

select * from COMMUNITY;

-- commLike table(좋아요) insert하고 select해서 확인해주세요
insert into commLike(comm_no,id,likePosted) values(10,'test',1);
insert into commLike(comm_no,id,likePosted) values(12,'test',1);
insert into commLike(comm_no,id,likePosted) values(10,'admin',1);


select * from COMMLIKE;











-- community sql 연습
select c.comm_no,c.timePosted, c.content, l.likePosted,c.id from(
	select comm_no,timePosted, content, id,ceil(rownum/5) as page from (
		select comm_no,to_char(timePosted, 'mm-dd am hh:mi:ss') as timePosted, content, id from community
		order by comm_no desc
	)
)c, (select comm_no, count(likePosted) as likePosted from commLike GROUP BY comm_no) l where l.comm_no(+)=c.comm_no and c.page=1;
select comm_no,to_char(timePosted, 'mm-dd am hh:mi:ss') as timePosted, content, id from community
insert into community(comm_no,timePosted,content,id) values(comm_seq.nextval,sysdate,'안녕ㅎㅋ','admin')
delete community where id='java'
update community set content='유진입니다' where id='java' and comm_no=13
delete community where comm_no=12 and id='java'
alter table community drop(likePosted)

--commpicture 연습
select picture_no, picture_name, comm_no from commpicture
insert into commpicture(picture_no,picture_name,comm_no) values(comm_pic_seq.nextval, 'img/community/1.jpg', 3)


--commLike 연습
select comm_no, id,likePosted from commLike c where comm_no=12 and id='java'
select count(*) from commLike c where comm_no=12 and id='java'
select comm_no,count(likePosted) as likePosted from commLike GROUP BY comm_no;
select count(likePosted) as likePosted from commLike where comm_no=12 GROUP BY comm_no

insert into commLike(comm_no,id,likePosted) values(12,'java',1)
insert into commLike(comm_no,id,likePosted) values(13,'admin',1)
delete commLike where id='java' and comm_no=10

select comm_no, heart, content, nickname from(
		select r.comm_no, r.heart, rank() over (order by r.heart desc) as rank, c.content, m.id, m.nickname 
		from (
			select comm_no, sum(likePosted) as heart
			from commLike
			group by comm_no
		) r, community c, member m
		where r.comm_no=c.comm_no and m.id=c.id
)

--comment 연습
select * from commcomment;

insert into commcomment(comment_no,comm_no,id,content) values(comment_seq.nextval,28,'java','댓글이에여')
insert into commcomment(comment_no,comm_no,id,content) values(comment_seq.nextval,13,'admin','댓글이에여')

update commcomment set content='댓글수정이에여22' where comment_no=2
update commcomment set content='안녕디지몬' where comment_no=1
delete COMMCOMMENT where comment_no=4 

select c.comment_no,c.comm_no,m.id,m.nickname,c.content 
from commcomment c, member m where c.id=m.id and comm_no=10 order by c.comment_no asc

select c.comment_no,c.comm_no,m.id,m.nickname,c.content 
		from commcomment c, member m
		where c.id=m.id and comment_no=3
		order by c.comment_no desc

		
--reply 연습
insert into replycomment(reply_no,comment_no,comm_no,id,content) values(comment_reply_seq.nextval,49,27,'test','대댓글22')

select r.reply_no,r.comment_no, c.content ,r.comm_no,m.id,m.nickname,r.content 
		from replycomment r, commcomment c, member m
		where c.id=m.id and c.comment_no=r.comment_no and r.comm_no=27
		order by r.reply_no desc
		
select r.reply_no,r.comment_no,r.comm_no,m.id,m.nickname,r.content 
		from replycomment r, member m
		where r.id=m.id and r.comm_no=27
		order by r.reply_no desc		
		

---------picture table 추가(2차)---------
drop sequence comm_pic_seq;
create sequence comm_pic_seq nocache;

drop table commpicture
create table commpicture(
	picture_no number primary key,
	picture_name varchar2(100) not null,
	comm_no number not null,
	constraint fk_comm_no foreign key(comm_no) references community(comm_no)
)

select c.comment_no,c.comm_no,m.id,m.nickname,c.content 
		from commcomment c, member m
		where c.id=m.id and comm_no=9
		order by c.comment_no desc
