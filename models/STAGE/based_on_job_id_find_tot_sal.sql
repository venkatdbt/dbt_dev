{{
    config(
        materialized = 'table'
    )
}}

{%- set job_ids =
[ "AD_PRES",
  "IT_PROG",
  "ST_CLERK",
  "SA_REP",
] -%}

select job_id,
{%- for job_id in job_ids -%}
sum({% if job_id == "AD_PRES" %}
case when job_id='AD_PRES' then salary end
{% elif job_id == 'IT_PROG' %}
case when job_id='IT_PROG' then salary end
{% elif job_id == 'ST_CLERK' %}
case when job_id='ST_CLERK' then salary end
{% elif job_id == 'SA_REP' %}
case when job_id='SA_REP' then salary end
{% endif %})
as {{job_id}}_amount
{%- if not loop.end %} ,
{% endif -%}
{%- endfor -%}
from {{ref('raw_employee')}} group by 1