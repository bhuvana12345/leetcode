# Write your MySQL query statement below

Select e.name, b.bonus
From Employee e
left outer join Bonus b
on e.empId = b.empId
where b.bonus < 1000 OR b.bonus IS NULL; 