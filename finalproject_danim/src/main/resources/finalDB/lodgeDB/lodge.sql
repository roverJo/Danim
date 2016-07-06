drop sequence lodge_seq;
create sequence lodge_seq nocache;

drop table lodge cascade constraint
create table lodge(
	lodge_no number primary key,
	shopname varchar2(100) not null,
	shopinfo clob not null,
	lodgetype varchar2(100) not null,
	price number not null,
	area_name varchar2(100) not null,
	detailarea_name varchar2(100) not null,
	local_area varchar2(100) not null,
	hits number default 0,
	constraint fk_lodge_detailarea foreign key(area_name,detailarea_name) references detailarea(area_name,detailarea_name)	
)

select * from lodge
delete  from lodge where lodge_no = 4;
delete from lodge cascade constraint
insert into lodge(lodge_no, shopname, shopinfo, lodgetype, price, area_name, detailarea_name,local_area)
values(lodge_seq.nextval,'블루보트게스트하우스','1','게스트하우스',23000,'서울특별시','서울','명동');
insert into lodge(lodge_no, shopname, shopinfo, lodgetype, price, area_name, detailarea_name,local_area)
values(lodge_seq.nextval,'풀게스트하우스','1','게스트하우스',25000,'부산광역시','부산','부산');
insert into lodge(lodge_no, shopname, shopinfo, lodgetype, price, area_name, detailarea_name,local_area)
values(lodge_seq.nextval,'스파라쿠아 전주 온천','1','찜질방',6000,'전라도','전주','전주');
insert into lodge(lodge_no, shopname, shopinfo, lodgetype, price, area_name, detailarea_name,local_area)
values(lodge_seq.nextval,'한스하우스','1','게스트하우스',40000,'서울특별시','서울','종로');
insert into lodge(lodge_no, shopname, shopinfo, lodgetype, price, area_name, detailarea_name,local_area)
values(lodge_seq.nextval,'김치하우스','1','게스트하우스',50000,'서울특별시','서울','종로');
insert into lodge(lodge_no, shopname, shopinfo, lodgetype, price, area_name, detailarea_name,local_area)
values(lodge_seq.nextval,'케이서울게스트하우스','1','게스트하우스',25000,'서울특별시','서울','용산');
insert into lodge(lodge_no, shopname, shopinfo, lodgetype, price, area_name, detailarea_name,local_area)
values(lodge_seq.nextval,'인서울게스트하우스','1','게스트하우스',40000,'서울특별시','서울','종로');

--업데이트 실행해야 숙박정보까지 보여짐
update lodge set shopinfo='인생의 항해길 가운데 저희 블루보트와 함께하며 뜻밖의 동행도 만나고
새로운 전환점이 되기도 하며, 쉼이 될 수 있는 시간이 되실 수 있으셨으면...
하는 바램으로 블루보트호는 항해중입니다.
블루보트 호스텔은 편안하고 안락한 숙박시설을 제공해 드릴 뿐만 아니라 건전한 여행
문화와 새로운 문화컨텐츠로써 여러분의 삶을 더욱 풍요롭게 해드리고자 최선을 다하겠습니다.
누구를 만나고 어떤 일이 생길지 모르기에 더욱 설레고 기대되는 항해 길을 우리 함께해요'
 where lodge_no=1;
 update lodge set shopinfo='저희 힐링게스트 하우스는 쾌적한 인테리어와 즐거운 여행 후 지친 몸을
편안하게 쉬다 가실 수 있는 공간입니다.
내 집 같은 편안한 서비스로 찾아와 주시는 모든 분들에게 여행의 즐거움을 더 해 드리겠습니다.

감사합니다.'
 where lodge_no=2;
 update lodge set shopinfo='가보고 싶은 곳!
머물고 싶은 곳!
스파라쿠아'
 where lodge_no=3;

select * from lodge

------------------------------------------------------------------

select l.lodge_no, l.lodgetype, p.picture_no, p.picture_name from lodge l, lodgepicture p
where l.lodge_no=p.lodge_no and p.picture_name like '%_a.jpg%' order by picture_no asc

