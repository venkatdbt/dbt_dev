{{
    config(
        materialized = 'view'
    )
}}

select * from DBT_TEST.DBT_SCHEMA.COUNTRY 
union all 
select * from {{ ref('my_third_dbt_model') }}