drop sequence foodmenu_seq;
create sequence foodmenu_seq nocache;

drop table foodmenu;
create table foodmenu(
	menu_no number primary key,
	food_picture varchar2(100) not null,
	price number not null,
	food_name varchar2(100) not null,
	foodshop_no number not null,
	constraint fk_foodmenu_bestfood foreign key(foodshop_no) references bestfood(foodshop_no)
)

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'닭꼬치.jpg',3000,'닭꼬치',1);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'핫바.jpg',2500,'핫바',1);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'핫도그.jpg',2000,'핫도그',1);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'족발.jpg',15000,'족발',2);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'냉채족발.jpg',20000,'냉채족발',2);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'광어',25000,'광어',3);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'새우.jpg',14000,'새우',3);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'모듬회.jpg',35000,'모듬회',3);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'오뎅.jpg',1500,'오뎅',4);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'떡볶이.jpg',2500,'떡볶이',4);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'라볶이.jpg',3000,'라볶이',4);

select *from foodmenu;
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'떡꼬치.jpg',1500,'라볶이',1);

----------------------------------------------------------------------------------------------------------------
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_아웃백영통점_menu.초코빵.jpg',1000,'초코빵',1);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_아웃백영통점_menu.커플세트.jpg',43000,'초코빵',1);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_아웃백영통점_menu.립스테이크.jpg',18000,'초코빵',1);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_아웃백영통점_menu.닭다리샐러드.jpg',7000,'초코빵',1);


insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_빵장수단팥빵_menu.크림빵.jpg',2000,'크림빵',2);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_빵장수단팥빵_menu.단팥빵.jpg',1500,'단팥빵',2);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_빵장수단팥빵_menu.초코단팥빵.jpg',2500,'초코단팥빵',2);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_도천진짜순대_menu.한상차림.jpg',2000,'한상차림',3);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_도천진짜순대_menu.순대전골.jpg',15000,'순대전골',3);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_도천진짜순대_menu.볶음밥.jpg',2000,'볶음밥',3);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_도천진짜순대_menu.백순대.jpg',10000,'백순대',3);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_우리황소곱창_menu.야채곱창.jpg',9000,'야채곱창',4);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_우리황소곱창_menu.소금구이.jpg',9000,'소금구이',4);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_우리황소곱창_menu.볶음밥.jpg',2000,'볶음밥',4);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_우리황소곱창_menu.곱창.jpg',10000,'곱창',4);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_보영만두_menu.튀김만두.jpg',3000,'튀김만두',5);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_보영만두_menu.쫄면.jpg',4500,'쫄면',5);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_보영만두_menu.찐만두.jpg',3500,'찐만두',5);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_보영만두_menu.김밥.jpg',1500,'김밥',5);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_부뚜막_menu.매운갈비찜.jpg',9000,'매운갈비찜',6);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_부뚜막_menu.해물갈비찜.jpg',11000,'해물갈비찜',6);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_부뚜막_menu.계란밥.jpg',1000,'계란밥',6);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_영통구_부뚜막_menu.계란찜.jpg',1500,'계란찜',6);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_유치회관_menu.선지국.jpg',7000,'선지국',7);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_유치회관_menu.해장국.jpg',7000,'해장국',7);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_가보정_menu.양념갈비.jpg',9500,'양념갈비',8);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_가보정_menu.꽃등심.jpg',11000,'꽃등심',8);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_가보정_menu.부챗살.jpg',11000,'부챗살',8);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_고베규카츠_menu.돈카츠.jpg',8000,'돈카츠',9);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_고베규카츠_menu.돈카츠정식.jpg',11000,'꽃등심',9);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_고베규카츠_menu.고베맥주.jpg',6000,'부챗살',9);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_고베규카츠_menu.화로돈카츠.jpg',10000,'부챗살',9);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_돈까스상회_menu.돈까스.jpg',7500,'돈까스',10);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_돈까스상회_menu.치즈돈까스.jpg',8000,'치즈돈까스',10);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_돈까스상회_menu.라베.jpg',8000,'라베',10);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_돈까스상회_menu.누룽지밥.jpg',7000,'누룽지밥',10);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_블랙스톤_menu.부채살스테이크.jpg',12000,'부채살스테이크',11);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_블랙스톤_menu.크림파스타.jpg',9500,'크림파스타',11);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_블랙스톤_menu.샐러드.jpg',9000,'샐러드',11);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_블랙스톤_menu.미니스테이크.jpg',10000,'미니스테이크',11);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_오탕소_menu.탕수육.jpg',10000,'탕수육',12);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_오탕소_menu.홍합탕.jpg',5000,'홍합탕',12);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_오탕소_menu.매콤탕수육.jpg',10000,'매콤탕수육',12);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_오탕소_menu.군만두.jpg',6000,'군만두',12);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_신스쭈꾸미_menu.쭈꾸미볶음.jpg',8000,'쭈꾸미볶음',13);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_신스쭈꾸미_menu.볶음밥.jpg',2000,'볶음밥',13);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_신스쭈꾸미_menu.새우쭈꾸미.jpg',10000,'새우쭈꾸미',13);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_신스쭈꾸미_menu.주먹밥.jpg',1500,'주먹밥',13);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_서가앤쿡_menu.까르보나라.jpg',13500,'까르보나라',14);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_서가앤쿡_menu.리조또.jpg',12000,'리조또',14);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_서가앤쿡_menu.카본스테이크.jpg',13000,'카본스테이크',14);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_팔달구_서가앤쿡_menu.커플세트.jpg',22500,'커플세트',14);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_장안구_남대문황금족발_menu.황금족발.jpg',25000,'황금족발',15);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_장안구_남대문황금족발_menu.깨족발.jpg',23000,'깨족발',15);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_장안구_남대문황금족발_menu.불족발.jpg',22000,'불족발',15);

insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_장안구_뼈다귀천국_menu.뼈해장국.jpg',6000,'뼈해장국',16);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_장안구_뼈다귀천국_menu.볶음밥.jpg',2000,'볶음밥',16);
insert into foodmenu(menu_no,food_picture,price,food_name,foodshop_no)
values(foodmenu_seq.nextval,'수원_장안구_뼈다귀천국_menu.뼈다귀전골.jpg',8000,'뼈다귀전골',16);
