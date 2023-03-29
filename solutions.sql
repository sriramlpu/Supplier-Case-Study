-- 1) List the month-wise average supply of parts supplied for all parts. Provide the information only if the average is higher than 20.
select monthname(dateofsupply) as month, avg(qtysupplied) as average from SupplyDetails
group by month
having average > 20;


-- 2) List the names of the Suppliers who do not supply part with PID ‘1’.
select 
    name 
from 
    supplierMaster sm
inner join SupplyDetails sd on sd.sid = sm.sid
where sd.pid <> 1;


-- 3) List the part id, name, price and difference between price and average price of all parts.
select 
    pid, 
    name,
    price,
    avg(price) over() as average_of_price,
    price-average_of_price
from 
    PartMaster
;


-- 4) List the names of the suppliers who have supplied at least one part where the quantity supplied is lower than 10.

select 
    sm.name--, sd.qtysupplied as qtysupplied, sd.pid as part_id
from 
    SupplierMaster sm
inner join SupplyDetails sd on sd.sid = sm.sid
where sd.qtysupplied< 10
group by 
    sm.sid, 
    sm.name;


-- 5) List the names of the suppliers who live in a city where no supply has been made.

select 
    sm.name--, 
    --sm.city, 
    --sd.qtysupplied
from 
    SupplierMaster sm
left join SupplyDetails sd on sd.city = sm.city
where sd.qtysupplied is null;


-- 6) List the names of the parts which have not been supplied in the month of May 2019.
select 
    pm.name, 
    to_date(sd.dateofsupply) as dateofsupply
from
    partmaster pm
inner join supplydetails sd on sd.pid = pm.pid
where pm.pid not in (select pid from supplydetails where year(dateofsupply) = 2019 and monthname(dateofsupply) = 'May');

-- or 

select 
    pm.name, 
    to_date(sd.dateofsupply) as dateofsupply
from
    partmaster pm
inner join supplydetails sd on sd.pid = pm.pid
where year(dateofsupply) = 2019 and monthname(dateofsupply) != 'May';


-- 7) List name and Price category for all parts. Price category has to be displayed as “Cheap” if price is less than 100, “Medium” if the price is greater than or equal to 100 and less than 500, and “Costly” if the price is greater than or equal to 500.
select
     name,
     -- price,
     -- category,
     case 
         when price < 100 then 'Cheap'
         when price >= 100 and price < 500 then 'Medium'
         else 'Costly'
    end as price_category
from
    partmaster;


-- 8) List the most recent supply details with information on Product name, price and no. of days elapsed since the latest supply.
select 
    pm.name as name,
    pm.price as price,
    dateofsupply,
    datediff(day,sd.dateofsupply,current_date()) as days_elapsed
from 
    partmaster pm
inner join supplydetails sd on sd.pid = pm.pid
where sd.dateofsupply in (select max(dateofsupply) from supplydetails);


-- 9) List the names of the suppliers who have supplied exactly 100 units of part P1.

select 
    name    
from
    suppliermaster sm
inner join supplydetails sd on sd.sid = sm.sid
inner join partmaster pm on pm.pid = sd.pid
where pm.category = 1
group by ;



select * from partmaster;
