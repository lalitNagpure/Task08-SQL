-- 1)find if we can do insert,update,alter,delete on view

select * from emp

select * from employee1

create view employee_data as 
select e.emp_name,e. mob,e.address, max(e.salary) from emp as e
inner join employee as m
on e.emp_id = m.department_id
group by e.emp_name,e. mob,e.address
having sum(e.salary)>700000


-- insert error show 
insert into employee_data (emp_name,mob,address)values (101,'Ram',55664411,'Mumbai')

-- update error show

update employee_data set address = 'jodhpur' where emp_name = 'Jolly'

-- alter update only rename, add show the error

alter view employee_data rename column emp_name to e_name

alter view employee_data add column post double precision


-- delete error show

delete from employee_data where emp_name = 'Laura Brown'


-- 2)having subquery

select * from employee

select * from emp


select emp_id,sum(salary),(select emp_name from employee as e where e.emp_id=m.emp_id)
from emp as m
group by emp_id 
having sum(salary)<= 60000

	