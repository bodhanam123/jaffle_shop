{{ config(materialized='append_only') }}
select * from {{ ref('stg_orders') }}