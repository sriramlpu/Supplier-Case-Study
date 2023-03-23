create database supplier;

create table SupplierMaster(
    sid int primary key,
    name varchar(40) not null,
    city char(6) not null,
    grade tinyint not null
);


insert into SupplierMaster values (10,'Usman khan','Delhi',1);
insert into SupplierMaster values (20,'NItish k','mumbai',2);
insert into SupplierMaster values (30,'Ram','USA',1);
insert into SupplierMaster values (40,'RAj','HYD',4);
insert into SupplierMaster values (50,'Akshay','Nagar',3);
insert into SupplierMaster values (60,'Iwser','Nasik',4);

create table PartMaster(
    pid tinyint primary key,
    name varchar(40) not null,
    price int not null,
    category tinyint not null,
    qtyonhand int
);


insert into PartMaster values(1,'Light',1000,1,1200);
insert into PartMaster values(2,'Batteries',5600,1,500);
insert into PartMaster values(3,'Engine',67000,2,4000);
insert into PartMaster values(4,'Tyres',2400,3,5000);
insert into PartMaster values(5,'Tubes',700,3,7800);
insert into PartMaster values(6,'Screws',12,2,200);
insert into PartMaster values(7,'Mirrors',450,2,3450);


create table SupplyDetails(
    pid tinyint references PartMaster(pid),
    sid int references SupplierMaster(sid),
    dateofsupply datetime not null,
    city varchar(40) not null,
    qtysupplied integer not null
);

insert into SupplyDetails values (2,30,'2019-4-21','Pune',45);
insert into SupplyDetails values (3,10,'2019-5-23','mumbai',25);
insert into SupplyDetails values (1,40,'2019-5-27','Kolkata',120);
insert into SupplyDetails values (5,50,'2019-6-29','Pune',45);
insert into SupplyDetails values (6,30,'2019-7-9','Sagali',100);
insert into SupplyDetails values (7,20,'2019-7-10','Delhi',30);

