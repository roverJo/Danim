drop sequence bus_seq;
create sequence bus_seq nocache;

drop table bus cascade constraint;
create table bus(
	bus_no number primary key,
	operation_time varchar2(100) not null,
	end_area varchar2(100) not null,
	terminal_no number not null,
	price number not null,
	leadtime varchar2(100) not null,
	bustype varchar2(100) not null,
	constraint fk_bus foreign key(terminal_no) references terminal(terminal_no)
)
delete from bus
delete from bus where end_area = '테스트'
commit
select * from bus where end_area = '테스트'
--1.서울고속터미널
--2.동서울종합터미널
--3.센트럴시티터미널
--4.서울남부터미널
--5.인천종합터미널
--6.부산종합터미널
--7.광주종합터미널
--8.대전복합터미널
--9.서대구고속터미널
--10.한진고속터미널
--11.용인공용터미널
--12.횡성휴게소고속터미널
--13.선산휴게소고속터미널
--14.정안휴게소고속터미널

update bus set end_area='강릉고속터미널'
where bus_no=1

select b.bus_no 
from bus b,terminal t
where b.terminal_no = t.terminal_no 
and t.terminal_name = ''
and b.end_area = ''
		and b.operation_time = #{operation_time}