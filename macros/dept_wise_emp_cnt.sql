{% macro dept_wise_emp_cnt(dept_tbl,emp_tbl) %}

select d.department_name,
       count(e.employee_id) as num_employess
from {{dept_tbl}} d
inner join {{emp_tbl}} e
on d.department_id=e.department_id
group by d.department_name

{% endmacro %}