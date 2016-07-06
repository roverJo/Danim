drop sequence foodcmt_seq;
create sequence foodcmt_seq nocache;

drop table foodcmt cascade constraint;
create table foodcmt(
	foodcmt_no number primary key,
	foodshop_no not null,
	id varchar2(100) not null,
	content varchar2(100) not null,
	constraint fk_foodcmt_id foreign key(id) references member(id) on delete cascade,
	constraint fk_foodcmt_no foreign key(foodshop_no) references bestfood(foodshop_no) on delete cascade
)

insert into foodcmt(foodcmt_no,foodshop_no,id,content) values(foodcmt_seq.nextval,2,'java','댓글입니다');

select * from foodcmt
