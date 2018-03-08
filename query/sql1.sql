create table shopmember(
    num int not null primary key,   /*회원번호*/
    memberlev varchar(2) default '10', /*회원등급*/
    id varchar(15) not null, 
    password varchar(12) not null,
    name varchar(12) not null,
    email varchar(30) not null,
    phone varchar(11) not null,
    gender varchar(1) not null,
    birthday varchar(8),
    age int, 
    addrnum varchar(8), /*우편번호*/
    address1 varchar(50),
    address2 varchar(50),
    reg_date date not null,
    buynum int default 0, /*구매횟수*/
    productnum int default 0 /*구매상품수*/
);

select * from shopmember;
insert into shopmember(num,memberlev,id,password,name,email,phone,gender,reg_date)
    values(1,'1','admin','admin','관리자','admin','admin','f',sysdate);
    
    
    
create table productboard(
    num int not null primary key, 
    boardid varchar(1) default '1', ㅇ
    regdate date not null,
    content varchar(3000) not null, ㅇ
    home varchar(1) default 't', ㅇ
    newpage varchar(1) default 't', ㅇ
    sale varchar(1) default 'f', ㅇ
    exposure varchar(1) default 'f',
    writerid varchar(30) not null, ㅇ
    ip varchar(20) not null, ㅇ
    productname varchar(30) not null, ㅇ
    price varchar(30) not null, ㅇ
    thumbnail varchar(30),
    filename1 varchar(30),
    filename2 varchar(30),
    filename3 varchar(30),
    filename4 varchar(30),    
    shippingfee varchar(30) not null, ㅇ
    filesize int,
    salepercent varchar(10),  ㅇ
    saleprice varchar(30) ㅇ
 );
create sequence productboardser
start with 1
increment by 1
nomaxvalue;

ALTER TABLE productboard ADD(exposure varchar(1));
commit; 샵에 노출 여부 선택
    
create table ordertable(
	ordernumkey int not null primary key,
	ordernum int not null,
	num int not null,
	productname varchar(30) not null,
	count int not null,
	originalprice varchar(30) not null,
	saleprice varchar(30),
	price varchar(30) not null,
	totalprice varchar(30) not null,
	name varchar(30) not null, 
	id varchar(30) not null, 
	getname varchar(30) not null,
	phone varchar(30) not null,
	addrnum varchar(30) not null,
	address1 varchar(30) not null,
	address2 varchar(30) not null,
    regdate date not null,
    status varchar(30),
    statususer varchar(30),
    moneycheck varchar(30),
    moneyregdate date
    );

create sequence ordertableser
start with 1
increment by 1
nomaxvalue;

create sequence ordertablekeyser
start with 1
increment by 1
nomaxvalue;

 ALTER TABLE ordertable ADD(regdate date);
commit; 
    
 create table MyTable (usr char(1), dt date);
insert into mytable values ('A','01-JAN-2009');
 insert into mytable values ('B','01-JAN-2009');
insert into mytable values ('A', '31-DEC-2008');
insert into mytable values ('B', '31-DEC-2008');
select usr, dt from mytable
where (usr, dt) in 
( select usr, max(dt) from mytable group by usr)

   select*from (select rownum rnum,a.* from 
    (select ordernum,ordernumkey,productname,totalprice,name,status,statususer,moneycheck from ordertable where(ordernum,ordernumkey)in(select ordernum,max(ordernumkey) from ordertable group by ordernum))a) 
    where rnum between 1 and 100;
    >> list의 최대 orderkeynum 값이 있는 행만 가져옴

create table wishtable(
	wishnum int not null primary key,
	id varchar(30) not null,
	num int not null
);

create sequence wishtableser
start with 1
increment by 1
nomaxvalue;








