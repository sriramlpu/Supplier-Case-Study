-- 1) List the month-wise average supply of parts supplied for all parts. Provide the information only if the average is higher than 20.
select
  monthname(dateofsupply) as month, 
  avg(qtysupplied) as average 
 from 
  SupplyDetails
group by 
  month
having 
  average > 20;


-- 2) List the names of the Suppliers who do not supply part with PID ‘1’.
select 
    name 
from 
    supplierMaster sm
inner join SupplyDetails sd on sd.sid = sm.sid
where sd.pid <> 1;


--3) List the part id, name, price and difference between price and average price of all parts.
select 
    pid, 
    name,
    price,
    avg(price) over() as average_of_price,
    price-average_of_price
from 
    PartMaster
;
