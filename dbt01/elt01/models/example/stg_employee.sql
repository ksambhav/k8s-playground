{{ config(materialized='table') }}
select * from {{source('db02', 'employee')}}