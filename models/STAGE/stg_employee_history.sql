
{{
    config(
        materialized = 'table'
    )
}}

--var declaration
{% set start_date= '1993-01-01'%}
{% set end_date = '1997-08-31' %}

select
j.job_title,
d.department_name,
e.first_name || ' ' || e.last_name as fullname
from {{ ref('raw_employee') }} e
inner join {{ ref('raw_job_history') }} jh
  on e.employee_id=jh.employee_id 
  and jh.start_date between '{{start_date}}' and  '{{end_date}}' 
inner join {{ ref('raw_job') }} j
  on e.job_id=j.job_id
inner join {{ ref('raw_department') }} d
  on e.department_id=d.department_id


