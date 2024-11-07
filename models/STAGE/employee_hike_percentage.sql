
{{
    config(
        materialized = 'table'
    )
}}
select 
{{ dbt_utils.generate_surrogate_key(['employee_id','first_name','job_id'])}} as skey,
 EMPLOYEE_ID,
 FIRST_NAME,
 JOB_ID,
 {{employee_hike('40')}} as tot_sal 
from {{ ref('raw_employee') }}