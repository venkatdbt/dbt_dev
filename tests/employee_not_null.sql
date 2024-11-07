with temp as(
select * from {{ref('raw_employee')}}
)
select * from temp where employee_id is null