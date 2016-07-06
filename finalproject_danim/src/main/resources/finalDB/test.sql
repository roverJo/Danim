select  foodshop_no,shopname,shop_add,foodtype,area_name,detailarea_name,main_price,main_food,local_area,main_menu_picture
from(
	select  foodshop_no,shopname,shop_add,foodtype,area_name,detailarea_name,main_price,main_food,local_area,main_menu_picture, ceil(rownum/5) as page
	from bestfood
) where page=1


select l.lodge_no,l.shopinfo,l.local_area,l.area_name,l.shopname,l.lodgetype,l.detailarea_name, p.picture_no, p.picture_name 
from lodge l, lodgepicture p 
where l.lodge_no=p.lodge_no and p.picture_name like '%_a.jpg%' 
		
select * from lodgepicture

select l.lodge_no, l.shopname, l.shopinfo, l.lodgetype, l.price, l.area_name, l.detailarea_name, l.local_area, p.picture_name from(
	select lodge_no, shopname, shopinfo, lodgetype, price, area_name, detailarea_name, local_area, ceil(rownum/3) as page 
	from lodge
	where shopname like '%' || '서' || '%' or
	shopinfo like '%' || '서' || '%' or 
	lodgetype like '%' || '서' || '%' or 
	area_name like '%' || '서' || '%' or 
	detailarea_name like '%' || '서' || '%' or 
	local_area like '%' || '서' || '%'
	order by lodge_no desc
) l, lodgepicture p where l.page=1 and l.lodge_no=p.lodge_no and p.picture_name like '%_a.jpg%'



select * from bestfood

select foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture from(
	select foodshop_no,shopname,shop_add,foodtype,main_price,main_food,area_name,detailarea_name,local_area,main_menu_picture, ceil(rownum/3) as page 
	from bestfood
	where shopname like '%' || '서' || '%' or
	shop_add like '%' || '서' || '%' or
	foodtype like '%' || '서' || '%' or
	main_food like '%' || '서' || '%' or
	area_name like '%' || '서' || '%' or
	detailarea_name like '%' || '서' || '%' or
	local_area like '%' || '서' || '%'
	order by foodshop_no desc
) where page=1

select terminal_no,terminal_name from terminal
 		where terminal_name = '서울고속터미널'
 		
select bus_no,operation_time,end_area,terminal_no,terminal_name,price,leadtime,bustype from(
	select bus_no,operation_time,end_area,terminal_no,terminal_name,price,leadtime,bustype,page from(
			select b.bus_no,b.operation_time,b.end_area,t.terminal_no,t.terminal_name,b.price,b.leadtime,b.bustype, ceil(rownum/50) as page from
	 			(select bus_no,terminal_no,operation_time,end_area,price,leadtime,bustype from bus) b,
	 			(select terminal_no,terminal_name from terminal) t 
				where b.terminal_no = t.terminal_no 
				)
	 		where terminal_name like '%' || '서' || '%' or end_area like '%' || '서' || '%'
	) where page=1

	
	select l.lodge_no,l.shopinfo,l.local_area,l.area_name,l.shopname,l.lodgetype,l.detailarea_name, p.picture_no, p.picture_name 
		from lodge l, lodgepicture p where l.lodge_no=p.lodge_no and p.picture_name like '%_a.jpg%'