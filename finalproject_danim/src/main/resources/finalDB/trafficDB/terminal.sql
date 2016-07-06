drop sequence terminal_seq;
create sequence terminal_seq nocache;

drop table terminal cascade constraint;
create table terminal(
	terminal_no number primary key,
	terminal_name varchar2(100) not null,
	area_name varchar2(100) not null,
	constraint fk_terminal foreign key(area_name) references area(area_name)
)

delete from terminal


insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'서울고속터미널','서울특별시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'동서울종합터미널','서울특별시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'센트럴시티터미널','서울특별시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'서울남부터미널','서울특별시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'인천종합터미널','인천광역시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'부산종합터미널','부산광역시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'광주종합터미널','광주광역시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'대전복합터미널','대전광역시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'서대구고속터미널','대구광역시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'한진고속터미널','대구광역시');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'용인공용터미널','경기도');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'횡성휴게소고속터미널','강원도');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'선산휴게소고속터미널','경상도');
insert into terminal(terminal_no,terminal_name,area_name)
values(terminal_seq.nextval,'정안휴게소고속터미널','충청도');



select * from terminal order by terminal_no asc




select b.bus_no,b.operation_time,b.end_area,b.price,b.leadtime,b.bustype,t.terminal_name 
from bus b,terminal t
where b.terminal_no = t.terminal_no
and t.terminal_name = #{terminal_name}
and 

