drop sequence food_seq;
create sequence food_seq nocache;

drop table bestfood cascade constraint;
create table bestfood(
	foodshop_no number primary key,
	shopname varchar2(100) not null,
	shop_add varchar2(100) not null,
	foodtype varchar2(100) not null,
	main_price number not null,
	main_food varchar2(100) not null,
	hits number default 0,
	area_name varchar2(100) not null,
	detailarea_name varchar2(100) not null,
	local_area varchar2(100) not null,
	main_menu_picture varchar2(100) not null,
	constraint fk_bestfood_detailarea foreign key(area_name,detailarea_name) references detailarea(area_name,detailarea_name)
)

--음식점 추가
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'강남닭꼬치','서울시 강남구 아이유빌딩 1층','분식',3000,'닭꼬치','서울특별시','서울','강남구','닭꼬치1.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'원조불족발','서울시 강남구 2호선 지하철안','한식',15000,'족발','서울특별시','서울','강서구','족발1.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'해운대횟집','부산광역시 해운대구 820-1번지','일식',25000,'광어','부산광역시','부산','해운대구','광어1.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'붉은오뎅','부산광역시 중구 중앙빌딩 3층','분식',1500,'오뎅','부산광역시','부산','중구','오뎅1.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'한번밥상','서울특별시 강남구 지하철역','한식',14500,'점심상','서울특별시','서울','영등포구','점심상1.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'특별짜장','서초구 102번지 2번길','중식',5000,'짜장면','서울특별시','서울','서초구','짜장면1.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'맛나는백반집','서울특별시 이태원 125번지','한식',5500,'백반','서울특별시','서울','중구','백반1.jpg');
--음식 완료
------------------------------------------
--경기도 수원
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'아웃백영통점','경기도 수원시 영통구 958-3','양식',22500,'투움바파스타','경기도','수원','영통구','수원_영통구_아웃백영통점_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'빵장수단팥빵','경기도 수원시 영통구 영통동 998-5','기타',2000,'단팥빵','경기도','수원','영통구','수원_영통구_빵장수단팥빵_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'도천진짜순대','경기도 수원시 영통구 영통동 1107','한식',8000,'순대전골','경기도','수원','영통구','수원_영통구_도천진짜순대_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'우리황소곱창','경기도 수원시 영통구 영통동 998-2','한식',16000,'곱창구이','경기도','수원','영통구','수원_영통구_우리황소곱창_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'보영만두','경기도 수원시 영통구 영통동 1009-1','분식',4000,'찐만두','경기도','수원','영통구','수원_영통구_보영만두_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'부뚜막','경기도 수원시 영통구 영통동 1009-2','한식',13000,'매운갈비찜','경기도','수원','영통구','수원_영통구_부뚜막_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'유치회관','경기도 수원시 팔달구 인계동 1132-4','한식',7000,'수육국밥','경기도','수원','팔달구','수원_팔달구_유치회관_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'가보정','경기도 수원시 팔달구 인계동 958-1','한식',9500,'양념갈비','경기도','수원','팔달구','수원_팔달구_가보정_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'고베규카츠','경기도 수원시 팔달구 인계동 1118-12 2층','일식',8000,'돈카츠','경기도','수원','팔달구','수원_팔달구_고베규카츠_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'돈까스상회','경기도 수원시 팔달구 인계동 1123-24','양식',7500,'돈까스','경기도','수원','팔달구','수원_팔달구_돈까스상회_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'블랙스톤','경기도 수원시 팔달구 인계동 1119-11','양식',12000,'부채살스테이크','경기도','수원','팔달구','수원_팔달구_블랙스톤_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'오탕소','경기도 수원시 팔달구 인계동 1119-11',' 타입',10000,'탕수육','경기도','수원','팔달구','수원_팔달구_오탕소_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'신스쭈꾸미','경기도 수원시 팔달구 인계동 1121','한식',8000,'쭈꾸미볶음','경기도','수원','팔달구','수원_팔달구_신스쭈꾸미_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'서가앤쿡','경기도 수원시 팔달구 인계동 1115-5','양식',13500,'까르보나라','경기도','수원','팔달구','수원_팔달구_서가앤쿡_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'남대문황금족발','경기도 수원시 장안구 정자2동 875','한식',25000,'황금족발','경기도','수원','장안구','수원_장안구_남대문황금족발_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'뼈다귀천국','경기도 수원시 장안구 정자동 71-5','한식',6000,'뼈해장국','경기도','수원','장안구','수원_장안구_뼈다귀천국_main.jpg');

--서울시
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'토끼정','서울시 강남구 역삼동 812-5','일식',11000,'크림카레우동','서울특별시','서울','강남구','서울_강남구_토끼정_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'홍명','서울시 강남구 논현동 37-9','중식',5500,'짜장면','서울특별시','서울','강남구','서울_강남구_홍명_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'C27','서울시 강남구 신사동 545-12','기타',4000,'초코조각케익','서울특별시','서울','강남구','서울_강남구_C27_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'스시타쿠','서울시 강남구 신사동 643-1','일식',130000,'오마카세','서울특별시','서울','강남구','서울_강남구_스시타쿠_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'멜팅샵','서울시 강남구 신사동 647-19','한식',14000,'육회 샐러드','서울특별시','서울','강남구','서울_강남구_멜팅샵_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'애슈리퀸즈','서울시 강남구 신사동 575','양식',29000,'애슐리메인','서울특별시','서울','강남구','서울_강남구_애슈리퀸즈_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'자맛풍','서울시 서초구 양재동 10-21','한식',40000,'코스요리','서울특별시','서울','강남구','서울_강남구_자맛풍_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'로스옥','서울시 강남구 도곡동 952-8','기타',29000,'등심로스구이','서울특별시','서울','강남구','서울_강남구_로스옥_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'세상의모든아침','서울특별시 영등포구 여의도동 28-1','양식',15000,'브런치샐러드','서울특별시','서울','영등포구','서울_영등구_세상의모든아침_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'송죽장','서울시 영등포구 영등포동 4가 55','중식',5000,'매콤짜장면','서울특별시','서울','영등포구','서울_영등구_송죽장_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'더함한우골','서울시 영등포구 여의도동 13-1 1층','기타',95000,'한우티본스테이크','서울특별시','서울','영등포구','서울_영등구_더함한우골_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'정인면옥','서울시 영등포구 여의도동 13-1 1층','기타',7000,'평양냉면','서울특별시','서울','영등포구','서울_영등구_정인면옥_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'이조보쌈','서울시 영등포구 당산동 6가 295','한식',38000,'굴모듬보쌈','서울특별시','서울','영등포구','서울_영등구_이조보쌈_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'또순이네','서울시 영등포구 양평동 4가 77-2','한식',6000,'된장찌개','서울특별시','서울','영등포구','서울_영등구_또순이네_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'카페마마스','서울시 영등포구 영등포동 4가 442','기타',8500,'닭가슴살샐러드','서울특별시','서울','영등포구','서울_영등구_카페마마스_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'진주집','서울시 영등포구 여의도동 36-2','기타',7000,'닭칼국수','서울특별시','서울','영등포구','서울_영등구_진주집_main.jpg');

--부산
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'할매국밥','부산시 동구 범일동 28-5','한식',6000,'할매국밥','부산광역시','부산','동구','부산_동구_할매국밥_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'암소갈비집','부산시 해운대구 중1동 1225-1','기타',38000,'생갈비','부산광역시','부산','해운대구','부산_해운대구_암소갈비집_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'미미루','부산광역시 동래구 온천동 154-3','중식',7000,'계란부추볶음','부산광역시','부산','동래구','부산_동래구_미미루_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'유달리','부산광역시 부산진구 전포동 677-1','기타',5000,'생과일쥬스','부산광역시','부산','부산진구','부산_부산진구_유달리_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'스완양분식','부산광역시 동구 범일동 252-16','분식',8000,'등심돈까스','부산광역시','부산','동구','부산_동구_스완양분식_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'해물도시','부산광역시 부산진구 부전동 515-3','한식',30000,'물회','부산광역시','부산','부산진구','부산_부산진구_해물도시_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'메르씨엘','부산시 해운대구 중동 1502','양식',40000,'메르씨엘코스','부산광역시','부산','해운대구','부산_해운대구_메르씨엘_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'오륙도가원','부산광역시 남구 용호동 894-55','기타',70000,'등심','부산광역시','부산','남구','부산_남구_오륙도가원_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'귀화식당','부산광역시 남구 용호동 957-1','양식',8000,'오므라이스','부산광역시','부산','남구','부산_남구_귀화식당_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'아넬로','부산시 해운대구 우동 1436-1','양식',11000,'필스너우르겔','부산광역시','부산','해운대구','부산_해운대구_아넬로_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'이가네떡볶이','부산광역시 중구 부평동2가 17','분식',20000,'쟁판떡볶이','부산광역시','부산','중구','부산_중구_이가네떡볶이_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'라라관','부산광역시 금정구 장전동 155-16','중식',7000,'마파두부','부산광역시','부산','금정구','부산_금정구_라라관_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'동화반전','부산시 중구 보수동 2가 73-8','중식',75000,'짜장면','부산광역시','부산','중구','부산_중구_동화반전_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'기장손칼국수','부산시 부산진구 부전2동 256-6','분식',8000,'손칼국수','부산광역시','부산','부산진구','부산_부산진구_기장손칼국수_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'아오모리','부산시 해운대구 우동1505 해운대 센텀호텔','일식',32000,'모듬회','부산광역시','부산','해운대구','부산_해운대구_아오모리_main.jpg');
insert into bestfood(foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture)
values(food_seq.nextval,'더파티','부산 해운대구 우동 1463-1','기타',15000,'뷔페','부산광역시','부산','해운대구','부산_해운대구_더파티_main.jpg');

-- 새로 등록시 위에 음식 완료 까지만 사용
------------------------------------------------------------------------------------------
--테이블 수정
alter table bestfood rename column food_no to foodshop_no;
alter table bestfood drop(price);
alter table bestfood local_area varchar2(100) not null,

alter table bestfood add(main_price number);
alter table bestfood add(main_food varchar2(100));
alter table bestfood add(hits number);


delete from bestfood;


select *from bestfood;

select food_no,shopname,shop_add,foodtype,price,area_name,detailarea_name from bestfood
where detailarea_name ='중구'

select food_no,shopname,shop_add,foodtype,price,area_name,detailarea_name from bestfood
 		where food_no=1

select foodshop_no,shopname,shop_add,foodtype,area_name,detailarea_name,main_price,main_food from bestfood
where detailarea_name ='강남' and foodtype='한식';

update bestfood set hits=hits+1 where foodshop_no=1;

select foodshop_no,shopname,shop_add,foodtype,area_name,detailarea_name,main_price,main_food
from bestfood 
where shopname='강남닭꼬치' and area_name='서울특별시' and detailarea_name='서울';

select f.foodshop_no,f.shopname,f.shop_add,f.foodtype,f.area_name,f.detailarea_name,f.main_price,f.main_food,f.main_menu_picture,f.local_area 
from (select foodshop_no,shopname,shop_add,foodtype,area_name,detailarea_name,main_price,main_food,main_menu_picture,local_area,ceil(rownum/#{numberOfContent}) as page 
from bestfood where detailarea_name =#{bestFoodVO.detailarea_name} and foodtype=#{bestFoodVO.foodtype} order by foodshop_no desc)f
where page = #{pageNo}

select *from foodmenu where foodshop_no='3';



select  foodshop_no,shopname,shop_add,foodtype,area_name,detailarea_name,main_price,main_food,local_area,main_menu_picture
 		from bestfood