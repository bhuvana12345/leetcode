# Write your MySQL query statement below
Select customer_number
from Orders
group by customer_number
order by Count(customer_number) desc
Limit 1;

