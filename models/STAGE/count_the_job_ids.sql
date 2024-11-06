{{
    config(
        materialized='table'
    )
}}

select job_id,
      {{markup('AD_PRES')}}  as AD_PRES,
      {{markup('IT_PROG')}}  as IT_PROG
 from {{ref('raw_employee')}} 
 group by job_id