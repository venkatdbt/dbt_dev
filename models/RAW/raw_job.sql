{{
    config(
        materialized = 'table'
    )
}}

select * from DBT_TEST.DBT_SCHEMA.JOBS 
