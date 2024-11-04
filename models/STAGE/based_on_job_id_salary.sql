{{
    config(
        materialized = 'view'
    )
}}
select job_id,
{%- set j_id =
[ "AD_PRES",
  "AD_VP",
  "IT_PROG",
  "FI_MGR",
  "FI_ACCOUNT",
  "PU_CLERK",
  "ST_CLERK",
  "SA_MAN",
  "SA_REP",
  "SH_CLERK",
  "AD_ASST",
  "MK_MAN",
  "AC_MGR",
  "AC_ACCOUNT",
  "ST_MAN",
  "MK_REP",
  "HR_REP",
  "PU_MAN",
  "PR_REP"
] -%}

{%- for i in j_id -%}       
case when job_id='{{i}}' then sum(SALARY) end as {{i}}_tot_amt
{%- if not loop.last -%},{% endif%}
{%- endfor %}
from {{ ref('raw_employee')}} group by 1