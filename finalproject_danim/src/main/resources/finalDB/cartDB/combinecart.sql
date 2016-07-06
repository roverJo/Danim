drop sequence combinecart_seq;
create sequence combinecart_seq nocache;

drop table combinecart cascade constraint;
create table combinecart(
	combinecart_no number,
	id varchar2(100),
	bus_no number default null,
	train_no number default null,
	lodge_no number default null,
	foodshop_no number default null,
	constraint pk_combinecart primary key(combinecart_no,id),
	constraint fk_combinecart_member foreign key(id) references member(id),
	constraint fk_combinecart_bus foreign key(bus_no) references bus(bus_no),
	constraint fk_combinecart_train foreign key(train_no) references train(train_no),
	constraint fk_combinecart_lodge foreign key(lodge_no) references lodge(lodge_no),
	constraint fk_combinecart_bestfood foreign key(foodshop_no) references bestfood(foodshop_no)
)



delete from notice where id = 'java';
delete from combinecart where id = 'java';
delete from message where recv_id = 'java';
delete from message where send_id = 'java';

delete from member where id = 'java';

delete from replycomment where id = 'admin';
delete from commcomment where id = 'admin';
delete from commLike where id = 'admin';
delete from community where id = 'java';

select * from community
select * from commLike
select * from commcomment
select * from replycomment


select * from combinecart
select * from combinecart
where combinecart_no = 9
delete from combinecart 
insert into combinecart(combinecart_no,id,bus_no,train_no,lodge_no,foodshop_no)
values(combinecart_seq.nextval,'qkqhwjsrk',3,3,1,1);

insert into combinecart(combinecart_no,id,bus_no,train_no,lodge_no,foodshop_no)
values(combinecart_seq.nextval,'qkqhwjsrk',null,null,1,null);


select b.bus_no,b.operation_time,b.end_area,b.price,b.leadtime,b.bustype,te.terminal_name
from terminal te,bus b,member m,combinecart cc
where te.terminal_no = b.terminal_no 
and cc.bus_no = b.bus_no 
and m.id = cc.id and cc.id = 'qkqhwjsrk'

select t.train_no,t.operation_time,t.end_area,t.price,t.leadtime,t.traintype
from station s,train t,member m,combinecart cc
where s.station_no = t.station_no 
and cc.train_no = t.train_no 
and m.id = cc.id and cc.id = 'java'

select f.foodshop_no,f.shopname,f.shop_add,f.foodtype,f.main_price,f.main_food,f.hits,f.detailarea_name
from bestfood f,member m,combinecart cc
where cc.foodshop_no = f.foodshop_no
and m.id = cc.id and cc.id = 'java'

select l.lodge_no,l.shopname,l.shopinfo,l.lodgetype,l.price,l.detailarea_name
from lodge l,member m,combinecart cc
where cc.lodge_no = l.lodge_no
and m.id = cc.id and cc.id = 'qkqhwjsrk'

//장바구니 정보 뽑아오기
select b.bus_no,b.operation_time,b.end_area,b.price,b.leadtime,b.bustype,te.terminal_name
,t.train_no,t.operation_time,t.end_area,t.price,t.leadtime,t.traintype,s.station_name
,f.foodshop_no,f.shopname,f.shop_add,f.foodtype,f.main_price,f.main_food,f.hits,f.detailarea_name
,l.lodge_no,l.shopname,l.shopinfo,l.lodgetype,l.price,l.detailarea_name
from terminal te,bus b,station s,train t,bestfood f,lodge l,member m,combinecart cc
where te.terminal_no = b.terminal_no 
and cc.bus_no = b.bus_no 
and s.station_no = t.station_no 
and cc.train_no = t.train_no 
and cc.foodshop_no = f.foodshop_no
and cc.lodge_no = l.lodge_no
and m.id = cc.id and cc.id = 'java'




select * from combinecart where id = 'java'

select b.bus_no,b.operation_time,b.end_area,b.price,b.leadtime,b.bustype,te.terminal_name
from terminal te,bus b,buscart bc,member m,combinecart cc
where te.terminal_no = b.terminal_no 
and bc.bus_no = b.bus_no 
and bc.id = cc.id 
and bc.bus_no = cc.bus_no 
and cc.bus_no = b.bus_no
and m.id = bc.id 
and m.id = cc.id
and bc.id = 'java'

select t.train_no,t.operation_time,t.end_area,t.price,t.leadtime,t.traintype
from station s,train t,traincart tc,member m,combinecart cc
where s.station_no = t.station_no 
and tc.train_no = t.train_no 
and tc.id = cc.id 
and tc.train_no = cc.train_no 
and cc.train_no = t.train_no
and m.id = tc.id 
and m.id = cc.id
and tc.id = 'java'

,,,lodge l,lodgepicture lp,bestfood f,,,lodgecart lc,foodcart fc,
,
l.lodge_no,l.shopname,l.shopinfo,l.lodgetype,l.price,l.detailarea_name,lp.picture_name
s.station_name,

,
f.foodshop_no,f.shopname,f.shop_add,f.foodtype,f.main_price,f.main_food,f.hits,f.detailarea_name

and l.lodge_no = lp.lodge_no and lc.lodge_no = l.lodge_no and lc.id = cc.id and lc.lodge_no = cc.lodge_no and cc.lodge_no = l.lodge_no
and f.foodshop_no = fc.foodshop_no and fc.id = cc.id and fc.foodshop_no = cc.foodshop_no and cc.foodshop_no = f.foodshop_no
and cc.id = 'qkqhwjsrk'

insert into combinecart()
values()

select * from buscart; 3
select * from traincart; 6
select * from lodgecart; 1 3
select * from foodcart; 1 3

insert into lodgecart(id,lodge_no)
values('java',2)

insert into foodcart(id,foodshop_no)
values('java',3)

select count(*) from buscart where id = 'qkqhwjsrk' and bus_no = 1;
where id = 'java' and bus_no = 1

drop table combinecart

select b.bus_no,b.operation_time as bus_operation_time,b.end_area as bus_end_area,b.price as busprice,b.leadtime as bus_leadtime,b.bustype,te.terminal_name
,t.train_no,t.operation_time as train_operation_time,t.end_area as train_end_area,t.price as trainprice,t.leadtime as train_leadtime,t.traintype,s.station_name
,f.foodshop_no,f.shopname,f.shop_add,f.foodtype,f.main_price,f.main_food,f.hits,f.detailarea_name
,l.lodge_no,l.shopname,l.shopinfo,l.lodgetype,l.price,l.detailarea_name
from terminal te,bus b,station s,train t,bestfood f,lodge l,member m,combinecart cc
where te.terminal_no = b.terminal_no 
and cc.bus_no = b.bus_no 
and s.station_no = t.station_no 
and cc.train_no = t.train_no 
and cc.foodshop_no = f.foodshop_no
and cc.lodge_no = l.lodge_no
and m.id = cc.id and cc.id = 'java'

select b.bus_no,b.operation_time as bus_operation_time,b.end_area as bus_end_area,b.price as busprice,b.leadtime as bus_leadtime,b.bustype,te.terminal_name
,t.train_no,t.operation_time as train_operation_time,t.end_area as train_end_area,t.price as trainprice,t.leadtime as train_leadtime,t.traintype,s.station_name
,f.foodshop_no,f.shopname as foodshopname,f.shop_add,f.foodtype,f.main_price,f.main_food,f.hits,f.detailarea_name as food_detailarea_name
,l.lodge_no,l.shopname as lodgeshopname,l.shopinfo,l.lodgetype,l.price as lodgeprice,l.detailarea_name as lodge_detailarea_name
from terminal te,bus b,station s,train t,bestfood f,lodge l,member m,combinecart cc
where te.terminal_no(+) = b.terminal_no 
and cc.bus_no = b.bus_no(+) 
and s.station_no(+) = t.station_no 
and cc.train_no = t.train_no(+) 
and cc.foodshop_no = f.foodshop_no(+)
and cc.lodge_no = l.lodge_no(+)
and m.id = cc.id and cc.id = 'qkqhwjsrk'

select b.bus_no,b.operation_time as bus_operation_time,b.end_area as bus_end_area,b.price as busprice,b.leadtime as bus_leadtime,b.bustype,te.terminal_name
,t.train_no,t.operation_time as train_operation_time,t.end_area as train_end_area,t.price as trainprice,t.leadtime as train_leadtime,t.traintype,s.station_name
,f.foodshop_no,f.shopname as foodshopname,f.shop_add,f.foodtype,f.main_price,f.main_food,f.hits,f.detailarea_name as food_detailarea_name
,l.lodge_no,l.shopname as lodgeshopname,l.shopinfo,l.lodgetype,l.price as lodgeprice,l.detailarea_name as lodge_detailarea_name
from terminal te,bus b,station s,train t,bestfood f,lodge l,combinecart cc
where te.terminal_no = b.terminal_no 
and cc.bus_no = b.bus_no 
and s.station_no = t.station_no 
and cc.train_no = t.train_no 
and cc.foodshop_no = f.foodshop_no
and cc.lodge_no = l.lodge_no
and cc.combinecart_no = 9


select b.bus_no,b.operation_time as bus_operation_time,b.end_area as bus_end_area,b.price as busprice,b.leadtime as bus_leadtime,b.bustype,te.terminal_name
,t.train_no,t.operation_time as train_operation_time,t.end_area as train_end_area,t.price as trainprice,t.leadtime as train_leadtime,t.traintype,s.station_name
,f.foodshop_no,f.shopname as foodshopname,f.shop_add,f.foodtype,f.main_price,f.main_food,f.hits,f.detailarea_name as food_detailarea_name
,l.lodge_no,l.shopname as lodgeshopname,l.shopinfo,l.lodgetype,l.price as lodgeprice,l.detailarea_name as lodge_detailarea_name
from combinecart cc right outer join bus b on b.bus_no = cc.bus_no left outer join terminal te on te.terminal_no = b.terminal_no,train t left outer join station s on s.station_no = t.station_no,bestfood f,lodge l,member m
where cc.id = 'qkqhwjsrk'

select cc.combinecart_no,b.bus_no,b.operation_time as bus_operation_time,b.end_area as bus_end_area,b.price as busprice,b.leadtime as bus_leadtime,b.bustype,te.terminal_name
,t.train_no,t.operation_time as train_operation_time,t.end_area as train_end_area,t.price as trainprice,t.leadtime as train_leadtime,t.traintype,s.station_name
,f.foodshop_no,f.shopname as foodshopname,f.shop_add,f.foodtype,f.main_price,f.main_food,f.hits,f.detailarea_name as food_detailarea_name
,l.lodge_no,l.shopname as lodgeshopname,l.shopinfo,l.lodgetype,l.price as lodgeprice,l.detailarea_name as lodge_detailarea_name
from terminal te,bus b,station s,train t,bestfood f,lodge l,member m,combinecart cc
where b.terminal_no = te.terminal_no(+) 
and cc.bus_no = b.bus_no(+) 
and t.station_no = s.station_no(+) 
and cc.train_no = t.train_no(+) 
and cc.foodshop_no = f.foodshop_no(+)
and cc.lodge_no = l.lodge_no(+)
and m.id = cc.id and cc.id = #{id} order by cc.combinecart_no desc

select ceil(rownum/5) as page from combinecart where cc.combinecart_no = 

select n.notice_no,n.timePosted,n.title,n.id,m.nickname from (
select notice_no,timePosted,title,ceil(rownum/#{numberOfContent}) as page,id from (
select notice_no,title,to_char(timePosted,'YYYY.MM.DD') as timePosted,
id from notice order by notice_no desc)) 
n,member m where n.id=m.id and page=#{pageNo}



select cc.combinecart_no,b.bus_no,b.operation_time as bus_operation_time,b.end_area as bus_end_area,b.price as busprice,b.leadtime as bus_leadtime,b.bustype,te.terminal_name
,t.train_no,t.operation_time as train_operation_time,t.end_area as train_end_area,t.price as trainprice,t.leadtime as train_leadtime,t.traintype,s.station_name
,f.foodshop_no,f.shopname as foodshopname,f.shop_add,f.foodtype,f.main_price,f.main_food,f.hits,f.detailarea_name as food_detailarea_name
,l.lodge_no,l.shopname as lodgeshopname,l.shopinfo,l.lodgetype,l.price as lodgeprice,l.detailarea_name as lodge_detailarea_name
from terminal te,bus b,station s,train t,bestfood f,lodge l,member m,combinecart cc
where b.terminal_no = te.terminal_no(+) 
and cc.bus_no = b.bus_no(+) 
and t.station_no = s.station_no(+) 
and cc.train_no = t.train_no(+) 
and cc.foodshop_no = f.foodshop_no(+)
and cc.lodge_no = l.lodge_no(+)
and m.id = cc.id and cc.id = 'java' order by cc.combinecart_no desc

select page,cc.combinecart_no,b.bus_no,b.operation_time as bus_operation_time,b.end_area as bus_end_area,b.price as busprice,b.leadtime as bus_leadtime,b.bustype,te.terminal_name
,t.train_no,t.operation_time as train_operation_time,t.end_area as train_end_area,t.price as trainprice,t.leadtime as train_leadtime,t.traintype,s.station_name
,f.foodshop_no,f.shopname as foodshopname,f.shop_add,f.foodtype,f.main_price,f.main_food,f.hits,f.detailarea_name as food_detailarea_name
,l.lodge_no,l.shopname as lodgeshopname,l.shopinfo,l.lodgetype,l.price as lodgeprice,l.detailarea_name as lodge_detailarea_name
from (select combinecart_no,id,bus_no,train_no,foodshop_no,lodge_no,ceil(rownum/3) as page from(select combinecart_no,id,bus_no,train_no,foodshop_no,lodge_no from combinecart order by combinecart_no desc))cc,terminal te,bus b,station s,train t,bestfood f,lodge l,member m
where b.terminal_no = te.terminal_no(+) 
and cc.bus_no = b.bus_no(+) 
and t.station_no = s.station_no(+) 
and cc.train_no = t.train_no(+) 
and cc.foodshop_no = f.foodshop_no(+)
and cc.lodge_no = l.lodge_no(+)
and m.id = cc.id and cc.id = 'java' and page = 2 order by combinecart_no desc

select count(*) from combinecart where id = 'java'