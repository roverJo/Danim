drop table area cascade constraint;
create table area(
	area_name varchar2(100) primary key
)

insert into area(area_name) values('서울특별시');
insert into area(area_name) values('부산광역시');
insert into area(area_name) values('대구광역시');
insert into area(area_name) values('인천광역시');
insert into area(area_name) values('광주광역시');
insert into area(area_name) values('대전광역시');
insert into area(area_name) values('울산광역시');
insert into area(area_name) values('경기도');
insert into area(area_name) values('강원도');
insert into area(area_name) values('충청도');
insert into area(area_name) values('전라도');
insert into area(area_name) values('경상도');

select * from area
