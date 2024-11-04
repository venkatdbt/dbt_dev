{{ 
    config(
        materialized = 'table'
    )
}}

{% set dept_emp_count = 2 %}

select c.country_name,l.city,count(d.department_id) as dept_count
from {{ ref('raw_country') }} c
inner join {{ ref('raw_location') }} l
on c.country_id=l.country_id
inner join {{ ref('raw_department') }} d
on l.location_id=d.location_id
inner join (select 
department_id,count(department_id)
from {{ ref('raw_employee') }} group by department_id having count(department_id)>='{{dept_emp_count}}') e
on d.department_id=e.department_id
group by c.country_name,l.city