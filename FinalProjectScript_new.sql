use mydb;

Select * from person;

insert into person values ('SysAdmin','sysadmin@gmail.com','sysadmin','admin','admin');
insert into person values ('Dharit','d@gmail.com','dharit','dharit','dharit');
insert into person values ('Raj','raj@gmail.com','raj','raj','raj');

select * from organization;



insert into organization values (1,'Amazon');


select * from useraccount;

insert into useraccount values (1,'dharit','dharit','Dharit',1);
insert into useraccount values (2,'raj','raj',1);

select * from department;

insert into department values (1,'Books','Highrated Books','Bestseller',1);
insert into department values (2,'Electronics','Daily Usage','Bestseller',1);

insert into department values (3,'clothing','Men and women','Bestseller',1);

select * from category;
insert into category values(1,'books','new arrival',1);
insert into category values(2,'books','half price',1);

insert into category values(3,'Electronics','new arrival',2);

insert into category values(4,'Electronics','half price',2);

insert into category values (5,'clothing','new arrival',3);
insert into category values (6,'clothing','halfprice',3);

select * from category_has_products;

insert into category_has_products values (1,1);
insert into category_has_products values (2,1);
insert into category_has_products values (3,2);
insert into category_has_products values (4,2);
insert into category_has_products values (5,3);
insert into category_has_products values (6,3);





select distinct c.categoryname from products p inner join category c on p.Category_CategoryId=c.CategoryId;

select * from products;
insert into products values (1,'half girlfriend','new',10,20,'ng','cb');
insert into products values(2,'full girlfriend','old',20,30,'nm','rr');
insert into products values (3,'computer','new',40,50,'vb','rr');
insert into products values (4,'laptop','old',30,30,'vb','rr');
insert into products values (5,'clothing','Newarrival',30,10,'not good','bb');
insert into products values (6,'clothing','halfprice',20,10,'Bestseller','cc');


select * from customerorder;
delete from customerorder where OrderId=1;
insert into customerorder values(1,'2017-12-13');
insert into customerorder values(2,'2017-12-13');
insert into customerorder values(3,'2017-12-13');
INSERT INTO customerorder VALUES (4,'2017-12-13');

select * from customerorder_has_products;

insert into customerorder_has_products values(1,1);

insert into customerorder_has_products values(2,1);


insert into customerorder_has_products values(3,2);
insert into customerorder_has_products values(4,3);

select c.orderid,p.productid,p.productname from customerorder_has_products cd inner join customerorder c on c.OrderId=cd.CustomerOrder_OrderId
inner join products p on p.ProductId=cd.Products_ProductId;

select * from address;
insert into address values (1,'home','3','saint germain','boston','ma',02115,1);
insert into address values (2,'work','6','saint germain','boston','ma',02115,2);

select * from paymentmethod;
insert into paymentmethod values (1,'credit card',123456789,10/21,234,1);
insert into paymentmethod values (2,'debit card',987654321,11/21,432,2);


select * from invoice;

insert into invoice value (1,1,1,1);

insert into invoice values ();

select * from warehouse;
insert into warehouse values(1,'Amazon warehouse');

select * from supplier;

insert into supplier values (1,'dharits3',1,1);

select * from shipment;

insert into shipment values (1,'dhl','usa','2017-12-13');



-- privileges--
create user systemadmin identified by 'sysadmin';
revoke all privileges,grant option from systemadmin;
grant all on mydb.*to systemadmin;
create user dharitshah identified by 'shah';
revoke all privileges,grant option from dharitshah;
grant select on mydb.department to dharitshah;
grant select on mydb.category to dharitshah;
grant select on mydb.products to dharitshah;
grant select on mydb.customerorder to dharitshah;
grant select on mydb.paymentmethod to dharitshah;
grant select on mydb.address to dharitshah;
grant update ,delete on mydb.customerorder to dharitshah;
grant update ,delete on mydb.paymentmethod to dharitshah;
grant update ,delete on mydb.address to dharitshah;
grant create,update,delete on mydb.useraccount to dharitshah;


-- views -- 
use mydb;

create view customer_order_new
as
select distinct u.UserName,c.orderid,d.department_id,cm.categoryname,p.productname,p.price
from customerorder c inner join customerorder_has_products cp
on c.orderid=cp.orderid
inner join products p
on cp.productid=p.productid
inner join category cm
on p.productid=cm.categoryid
inner join department d
on cm.Department_Id=d.Department_Id
inner join organization op
on d.OrganizationId=op.OrganizationId
inner join useraccount u
on op.OrganizationId=u.OrganizationId
;

select * from customer_order_new;


-- view2 --
create view invoice_new
as
select distinct u.UserName,c.orderid,d.department_id,cm.categoryname,p.productname,p.price,
a.addresstype,a.apartmentnumber,a.streetname,a.city,a.zipcode,pm.paymenttype
from customerorder c inner join customerorder_has_products cp
on c.orderid=cp.orderid
inner join products p
on cp.productid=p.productid
inner join category cm
on p.productid=cm.categoryid
inner join department d
on cm.Department_Id=d.Department_Id
inner join organization op
on d.OrganizationId=op.OrganizationId
inner join useraccount u
on op.OrganizationId=u.OrganizationId
inner join address a
on c.OrderId=a.OrderId
inner join paymentmethod pm
on c.OrderId=pm.OrderId;

select * from invoice_new;


-- view3 --

create view shipment_details
as
select i.CustomerOrder_OrderId ,w.warehousename ,s.suppliername ,spm.shippername from invoice i inner join customerorder c
on c.orderid=i.CustomerOrder_OrderId
inner join warehouse w
on i.warehouseid = w.warehouseid
inner join  supplier s
on w.warehouseid = s.warehouseid
inner join shipment spm
on s.shipmentid=spm.shipmentid;

select * from shipment_details;


-- view4--

create view shipment_details_final
as
select distinct u.UserName,c.orderid,d.department_id,cm.categoryname,p.productname,p.price,
a.addresstype,a.apartmentnumber,a.streetname,a.city,a.zipcode,pm.paymenttype,w.WarehouseName,s.SupplierName,sp.ShipperName
from customerorder c inner join customerorder_has_products cp
on c.orderid=cp.orderid
inner join products p
on cp.productid=p.productid
inner join category cm
on p.productid=cm.categoryid
inner join department d
on cm.Department_Id=d.Department_Id
inner join organization op
on d.OrganizationId=op.OrganizationId
inner join useraccount u
on op.OrganizationId=u.OrganizationId
inner join address a
on c.OrderId=a.OrderId
inner join paymentmethod pm
on c.OrderId=pm.OrderId
inner join invoice i
on c.OrderId=i.CustomerOrder_OrderId
inner join warehouse w
on i.WarehouseId=w.WarehouseId
inner join supplier s
on w.WarehouseId=s.WarehouseId
inner join shipment sp
on s.ShipmentId=sp.ShipmentId;


select * from shipment_details_final;


-- analysis--

-- Most Popular Products--
select  p.productid ,p.productname as 'Most Popular' ,cmd.categoryname 
from customerorder c inner join customerorder_has_products cp
on c.orderid=cp.orderid
inner join products p
on cp.productid=p.productid
inner join category_has_products chp
on p.ProductId=chp.ProductId
inner join category cmd
on chp.CategoryId=cmd.CategoryId
having count(p.ProductName)>1;
//

-- Highest revenue generated by department--

select d.department_id,d.departmentname,cm.categoryname,p.productname,sum(p.price) as 'Highest Seller department'
from customerorder c 
inner join customerorder_has_products cp
on c.orderid=cp.orderid
inner join products p
on cp.productid=p.productid
inner join category cm
on p.productid=cm.categoryid
inner join department d
on cm.Department_Id=d.Department_Id
having count(d.department_id)>=1




-- triggers --


delimiter //
create trigger add_a_category
after insert on department
for each row 
begin
insert into category
select 7,'Baby Care',
(select CategoryType from category where CategoryId=1),
4;
end//
//
insert into department
select 4,'Baby Care','Personal Care','New Arrival',1;

select * from category;

select * from products;

delimiter //

create trigger add_product
after insert on category
for each row
begin
insert into products
select 7,'babycare','halfprice',10,20,'not good','cc';
end; //

insert into category
select 8,'babycare','halfprice',4;

select * from products;


delimiter //

create trigger add_user
after insert on person
for each row
begin
insert into useraccount 
select 4,'password','Yusuf',1;
end; //

insert into person
select 'Dharit shah','dharits3@gmail.com','Yusuf','password','password';
//

//


-- procedures --
delimiter //
create procedure product_details(in val int)
begin 
select p.productName,p.Price,p.SupplierName
from products as p inner join CustomerOrder_has_Products as c 
on p.ProductId = c.ProductId
inner join customerorder cd
on c.orderid=cd.OrderId
where cd.OrderId=val;


end;
//


delimiter //
create procedure shipment_details(in val int)
begin
select distinct u.UserName,c.orderid,d.department_id,cm.categoryname,p.productname,p.price,
a.addresstype,a.apartmentnumber,a.streetname,a.city,a.zipcode,pm.paymenttype,w.WarehouseName,s.SupplierName,sp.ShipperName
from customerorder c inner join customerorder_has_products cp
on c.orderid=cp.orderid
inner join products p
on cp.productid=p.productid
inner join category cm
on p.productid=cm.categoryid
inner join department d
on cm.Department_Id=d.Department_Id
inner join organization op
on d.OrganizationId=op.OrganizationId
inner join useraccount u
on op.OrganizationId=u.OrganizationId
inner join address a
on c.OrderId=a.OrderId
inner join paymentmethod pm
on c.OrderId=pm.OrderId
inner join invoice i
on c.OrderId=i.CustomerOrder_OrderId
inner join warehouse w
on i.WarehouseId=w.WarehouseId
inner join supplier s
on w.WarehouseId=s.WarehouseId
inner join shipment sp
on s.ShipmentId=sp.ShipmentId
where s.ShipmentId=val;

end;


//

select p.productName,p.Price,p.SupplierName
from products as p inner join CustomerOrder_has_Products as c inner join CustomerOrder as co
on p.productID=c.productId and c.OrderId=co.OrderId;



-- lock --
delimiter $$

lock table payment read;

$$

-- procedures --
select * from category;
delimiter &&
create procedure discount3(in name_1 varchar(45))
begin

select p.productname,(p.Price-(0.5*p.Price)) as 'Discounted Price' from products p inner join category_has_products cm
on p.ProductId=cm.CategoryId inner join category c
on c.CategoryId=cm.CategoryId where c.CategoryType=name_1;
end;
&& 
select p.productname,p.Price from products p inner join category_has_products cm
on p.ProductId=cm.CategoryId inner join category c
on c.CategoryId=cm.CategoryId where c.CategoryType= 'half price';

delimiter //

create procedure availability_1(in avail int(10))
begin

select o.orderid,p.productname,(p.Availablility-1) as 'new available' from customerorder o inner join customerorder_has_products cm
on o.orderid=cm.orderid  inner join products p
on cm.ProductId=p.ProductId where o.OrderId = avail;

end;
//


select o.orderid,p.productname,p.Availablility from customerorder o inner join customerorder_has_products cm
on o.orderid=cm.orderid  inner join products p
on cm.ProductId=p.ProductId where o.OrderId = 1;

