{{
    config(
        pre_hook="set session query_max_run_time='10m'",
        materialized='table',
        properties= {
          "object_store_layout_enabled" : true,
          "format": "'PARQUET'",
          "partitioning": "ARRAY['id']",
          "sorted_by ": "ARRAY['name DESC NULLS FIRST']",
          "parquet_bloom_filter_columns" : "ARRAY['id']"
        }
    )
}}
select id, name from {{source('db02', 'employee')}}