with temp as(
select * from {{ref('raw_employee')}}
)
select job_id,count(1) from temp  group by job_id having count(1)>1