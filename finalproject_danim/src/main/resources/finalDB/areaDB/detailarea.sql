drop table detailarea cascade constraint;
create table detailarea(
	area_name varchar2(100),
	detailarea_name varchar2(100),
	constraint pk_detailarea primary key(area_name,detailarea_name),
	constraint fk_detailarea foreign key(area_name) references area(area_name)
)

-- 광역시 7개
insert into detailarea(area_name,detailarea_name) values ('서울특별시','서울');
insert into detailarea(area_name,detailarea_name) values ('부산광역시','부산');
insert into detailarea(area_name,detailarea_name) values ('인천광역시','인천');
insert into detailarea(area_name,detailarea_name) values ('울산광역시','울산');
insert into detailarea(area_name,detailarea_name) values ('대전광역시','대전');
insert into detailarea(area_name,detailarea_name) values ('대구광역시','대구');
insert into detailarea(area_name,detailarea_name) values ('광주광역시','광주');
-- 여기서부터는 도
--경기도 28개 
insert into detailarea(area_name,detailarea_name) values ('경기도','안양');
insert into detailarea(area_name,detailarea_name) values ('경기도','여주');
insert into detailarea(area_name,detailarea_name) values ('경기도','구리');
insert into detailarea(area_name,detailarea_name) values ('경기도','군포');
insert into detailarea(area_name,detailarea_name) values ('경기도','과천');
insert into detailarea(area_name,detailarea_name) values ('경기도','고양');
insert into detailarea(area_name,detailarea_name) values ('경기도','시흥');
insert into detailarea(area_name,detailarea_name) values ('경기도','의왕');
insert into detailarea(area_name,detailarea_name) values ('경기도','용인');
insert into detailarea(area_name,detailarea_name) values ('경기도','이천');
insert into detailarea(area_name,detailarea_name) values ('경기도','광명');
insert into detailarea(area_name,detailarea_name) values ('경기도','화성');
insert into detailarea(area_name,detailarea_name) values ('경기도','안산');
insert into detailarea(area_name,detailarea_name) values ('경기도','오산');
insert into detailarea(area_name,detailarea_name) values ('경기도','안성');
insert into detailarea(area_name,detailarea_name) values ('경기도','평택');
insert into detailarea(area_name,detailarea_name) values ('경기도','양주');
insert into detailarea(area_name,detailarea_name) values ('경기도','김포');
insert into detailarea(area_name,detailarea_name) values ('경기도','수원');
insert into detailarea(area_name,detailarea_name) values ('경기도','동두천');
insert into detailarea(area_name,detailarea_name) values ('경기도','의정부');
insert into detailarea(area_name,detailarea_name) values ('경기도','광주');
insert into detailarea(area_name,detailarea_name) values ('경기도','하남');
insert into detailarea(area_name,detailarea_name) values ('경기도','남양주');
insert into detailarea(area_name,detailarea_name) values ('경기도','부천');
insert into detailarea(area_name,detailarea_name) values ('경기도','성남');
insert into detailarea(area_name,detailarea_name) values ('경기도','파주');
insert into detailarea(area_name,detailarea_name) values ('경기도','포천시');
--강원도 7개
insert into detailarea(area_name,detailarea_name) values ('강원도','원주');
insert into detailarea(area_name,detailarea_name) values ('강원도','춘천');
insert into detailarea(area_name,detailarea_name) values ('강원도','강릉');
insert into detailarea(area_name,detailarea_name) values ('강원도','동해');
insert into detailarea(area_name,detailarea_name) values ('강원도','속초');
insert into detailarea(area_name,detailarea_name) values ('강원도','삼척');
insert into detailarea(area_name,detailarea_name) values ('강원도','태백');
--전라도 11개
--전라북
insert into detailarea(area_name,detailarea_name) values ('전라도','전주');
insert into detailarea(area_name,detailarea_name) values ('전라도','군산');
insert into detailarea(area_name,detailarea_name) values ('전라도','익산');
insert into detailarea(area_name,detailarea_name) values ('전라도','정읍');
insert into detailarea(area_name,detailarea_name) values ('전라도','남원');
insert into detailarea(area_name,detailarea_name) values ('전라도','김제');
--전라남
insert into detailarea(area_name,detailarea_name) values ('전라도','목포');
insert into detailarea(area_name,detailarea_name) values ('전라도','여수');
insert into detailarea(area_name,detailarea_name) values ('전라도','순천');
insert into detailarea(area_name,detailarea_name) values ('전라도','나주');
insert into detailarea(area_name,detailarea_name) values ('전라도','광양');
--충청도 11개
--충청 남
insert into detailarea(area_name,detailarea_name) values ('충청도','천안');
insert into detailarea(area_name,detailarea_name) values ('충청도','공주');
insert into detailarea(area_name,detailarea_name) values ('충청도','보령');
insert into detailarea(area_name,detailarea_name) values ('충청도','아산');
insert into detailarea(area_name,detailarea_name) values ('충청도','서산');
insert into detailarea(area_name,detailarea_name) values ('충청도','논산');
insert into detailarea(area_name,detailarea_name) values ('충청도','계룡');
insert into detailarea(area_name,detailarea_name) values ('충청도','당진');
--충청 북
insert into detailarea(area_name,detailarea_name) values ('충청도','청주');
insert into detailarea(area_name,detailarea_name) values ('충청도','충주');
insert into detailarea(area_name,detailarea_name) values ('충청도','제천');
--경상도 18개
--경상 북
insert into detailarea(area_name,detailarea_name) values ('경상도','포항');
insert into detailarea(area_name,detailarea_name) values ('경상도','경주');
insert into detailarea(area_name,detailarea_name) values ('경상도','김천');
insert into detailarea(area_name,detailarea_name) values ('경상도','안동');
insert into detailarea(area_name,detailarea_name) values ('경상도','구미');
insert into detailarea(area_name,detailarea_name) values ('경상도','영주');
insert into detailarea(area_name,detailarea_name) values ('경상도','영천');
insert into detailarea(area_name,detailarea_name) values ('경상도','상주');
insert into detailarea(area_name,detailarea_name) values ('경상도','문경');
insert into detailarea(area_name,detailarea_name) values ('경상도','경산');
--경상 남
insert into detailarea(area_name,detailarea_name) values ('경상도','창원');
insert into detailarea(area_name,detailarea_name) values ('경상도','진주');
insert into detailarea(area_name,detailarea_name) values ('경상도','통영');
insert into detailarea(area_name,detailarea_name) values ('경상도','사천');
insert into detailarea(area_name,detailarea_name) values ('경상도','김해');
insert into detailarea(area_name,detailarea_name) values ('경상도','밀양');
insert into detailarea(area_name,detailarea_name) values ('경상도','거제');
insert into detailarea(area_name,detailarea_name) values ('경상도','양산');

select * from detailarea
