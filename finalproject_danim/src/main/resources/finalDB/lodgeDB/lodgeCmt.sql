drop sequence lodgecmt_seq;
create sequence lodgecmt_seq nocache;

drop table lodgecmt cascade constraint;
create table lodgecmt(
	lodgecmt_no number primary key,
	lodge_no not null,
	id varchar2(100) not null,
	content varchar2(100) not null,
	constraint fk_lodgecmt_id foreign key(id) references member(id) on delete cascade,
	constraint fk_lodgecmt_no foreign key(lodge_no) references lodge(lodge_no) on delete cascade
)
insert into lodgecmt(lodgecmt_no,lodge_no,id,content) values(lodgecmt_seq.nextval,1,'java','댓글입니다');
insert into lodgecmt(lodgecmt_no,lodge_no,id,content) values(lodgecmt_seq.nextval,7,'java','댓글입니다');

select * from LODGECMT

select lodgecmt_no,lodge_no as lodge from lodgecmt where lodgecmt_no = 45

select c.lodgecmt_no, c.lodge_no, m.id, m.nickname, c.content
from (select lodgecmt_no,lodge_no from lodgecmt where lodgecmt_no = 45)c, lodge l, member m
where c.id=m.id and l.lodge_no=c.lodge_no and l.lodge_no = c.lodge_no
order by c.lodgecmt_no desc


select c.lodgecmt_no, c.lodge_no, m.id, m.nickname, c.content
from lodgecmt c, member m,
where c.id=m.id and l.lodge_no=c.lodge_no and c.lodgecmt_no=45
order by c.lodgecmt_no desc