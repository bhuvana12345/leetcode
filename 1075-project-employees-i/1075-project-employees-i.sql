# Write your MySQL query statement below

Select p.project_id, ROUND(AVG( e.experience_years),2) AS average_years
From employee e
INNER JOIN project p
on e.employee_id = p.employee_id
group by p.project_id 
Order by project_id 