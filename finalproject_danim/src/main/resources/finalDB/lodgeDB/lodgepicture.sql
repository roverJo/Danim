drop sequence lodgepicture_seq;
create sequence lodgepicture_seq nocache;

drop table lodgepicture cascade constraint;
create table lodgepicture(
	picture_no number primary key,
  	lodge_no number not null,
   	picture_name varchar2(100) not null,
   	constraint fk_lodgepicture foreign key(lodge_no) references lodge(lodge_no)
)

delete from lodgepicture where lodge_no = 4

insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,1,'guest01_a.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,1,'guest01_b.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,1,'guest01_c.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,1,'guest01_d.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,2,'guest02_a.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,2,'guest02_b.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,2,'guest02_c.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,2,'guest02_d.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,3,'room01_a.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,3,'room01_b.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,3,'room01_c.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,3,'room01_d.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,4,'guest03_a.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,4,'guest03_b.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,4,'guest03_c.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,4,'guest03_d.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,5,'guest04_a.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,5,'guest04_b.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,5,'guest04_c.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,5,'guest04_d.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,6,'guest05_a.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,6,'guest05_b.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,6,'guest05_c.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,6,'guest05_d.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,7,'guest06_a.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,7,'guest06_b.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,7,'guest06_c.jpg');
insert into lodgepicture(picture_no,lodge_no,picture_name) values(lodgepicture_seq.nextval,7,'guest06_d.jpg');

select * from lodgepicture


