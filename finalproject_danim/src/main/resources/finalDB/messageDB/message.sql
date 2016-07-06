drop sequence message_seq;
create sequence message_seq;

drop table message
create table message(
	message_no number primary key,
	title varchar2(100) not null,
	content clob not null, 
	recv_id varchar2(100) not null,
	send_id varchar2(100) not null,
	mess_date date not null,
	read_acc number default 0,
	read_del varchar2(100) not null,
	send_del varchar2(100) not null,
	constraint fk_rcv_message_recv_id foreign key(recv_id) references member(id),
	constraint fk_rcv_message_send_id foreign key(send_id) references member(id)
)

insert into message(message_no,title,content,recv_id,send_id,mess_date,read_acc,read_del,send_del) 
values(message_seq.nextval,'욜루','~!@)(%*!(#@%*)!@%&!)(*@$!@','admin','java',sysdate,0,'N','N')

select r.message_no,r.title,r.recv_id,m.send_id,m.nickname,to_char(mess_date, 'yy-mm-dd') as mess_date,r.read_acc,r.read_del from(
	select id as send_id,nickname from member
)m, message r where r.send_id=m.send_id and r.recv_id='java' and r.read_del='N'

select r.message_no,r.title,r.content,r.recv_id,m.send_id,m.nickname,to_char(mess_date, 'yy-mm-dd am hh:mi:ss') as mess_date,r.read_acc from(
			select id as send_id,nickname from member
		)m, message r where r.send_id=m.send_id and r.recv_id='java' and r.message_no=39

update message set read_acc=0 where message_no=1

update message set read_del='N' where message_no=3

delete message where message_no=3 and read_del='Y' and send_del='Y'

-- 보낸 쪽지함 paging --
select message_no,title,recv_id,send_id,nickname,mess_date,send_del,page from(
	select r.message_no,r.title,m.recv_id,r.send_id,m.nickname,to_char(mess_date, 'yy-mm-dd') as mess_date,r.send_del,ceil(rownum/10) as page from(
			select id as recv_id,nickname from member
		) m, message r where r.recv_id=m.recv_id and r.send_id='java' and r.send_del='N' order by message_no desc
	) r where page=1
-- 보낸 쪽지함 count --	
select count(*) from message where send_id='java' and send_del='N'	
-- 받은 쪽지함 paging --
select message_no,title,recv_id,send_id,nickname,mess_date,read_acc,read_del,page from(
	select r.message_no,r.title,r.recv_id,m.send_id,m.nickname,to_char(mess_date, 'yy-mm-dd') as mess_date,r.read_acc,r.read_del,ceil(rownum/10) as page from(
			select id as send_id,nickname from member
		)m, message r where r.send_id=m.send_id and r.recv_id='java' and r.read_del='N' order by message_no desc
	) r where page=1
-- 받은 쪽지함 count --
select count(*) from message where recv_id='java' and read_del='N'
	
		
select r.message_no,r.title,r.content,m.recv_id,r.send_id,m.nickname,to_char(mess_date, 'yy-mm-dd am hh:mi:ss') as mess_date from(
			select id as recv_id,nickname from member
		)m, message r where r.recv_id=m.recv_id and r.send_id='window' and r.message_no=30

select count(*) from message where recv_id='java' and read_acc=0

select message_no,title,recv_id,send_id,nickname,mess_date,send_del,page from(
		select r.message_no,r.title,m.recv_id,r.send_id,m.nickname,to_char(mess_date, 'yy-mm-dd') as mess_date,r.send_del,ceil(rownum/15) as page from(
			select id as recv_id,nickname from member
		) m, message r where r.recv_id=m.recv_id and r.send_id='java' and r.send_del='N' order by message_no desc
	) r where page=1
	
select * from message where recv_id='test'