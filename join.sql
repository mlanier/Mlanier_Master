select  T1.idx,T1.cust_id,T1.order_date as first,T2.order_date as second,DATEPART ( week , T2.order_date )  -DATEPART ( week , T1.order_date ) as diff,DATEPART ( year , T1.order_date ) as year_1, DATEPART ( yy , T2.order_date ) as year_2
from Tab as T1 inner join Tab as T2 on T1.cust_id=T2.cust_id 
where 
DATEPART ( week , T2.order_date )  -DATEPART ( week , T1.order_date )  =1 and
DATEPART ( yy , T2.order_date ) - DATEPART ( yy , T1.order_date )=0 and
T2.units_purchased<4 
order by T1.idx


select * from Tab as T1 left join

(select T1.cust_id as previous_cust,T1.items as previous_buy, 1 as returning from Tab as T1 inner join Tab as T2 on T1.cust_id=T2.cust_id where DATEDIFF(d,T1.order_date,T2.order_date)>0) as T2 on T1.idx=T2.idx