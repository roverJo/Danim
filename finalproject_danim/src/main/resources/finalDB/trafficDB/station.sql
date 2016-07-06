drop sequence station_seq;
create sequence station_seq nocache;

drop table station cascade constraint;
create table station(
	station_no number primary key,
	station_name varchar2(100) not null,
	area_name varchar2(100) not null,
	constraint fk_station foreign key(area_name) references area(area_name)
)

insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'서울역','서울특별시');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'목포역','전라도');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'진주역','경상도');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'여수EXPO역','전라도');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'부산역','부산광역시');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'행신역','경기도');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'오송역','충청도');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'광명역','경기도');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'천안아산역','충청도');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'청량리역','서울특별시');
insert into station(station_no,station_name,area_name)
values(station_seq.nextval,'용산역','서울특별시');
select *from station