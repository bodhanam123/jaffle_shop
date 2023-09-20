{% macro default__create_or_replace_clone() %}

{% set payment_methods_query %}
 create or replace table  {{ ref('stg_orders') }}  as {{ ref('raw_customers') }}
{% endset %}

{% set results = run_query(payment_methods_query) %}
    
{% endmacro %}




  