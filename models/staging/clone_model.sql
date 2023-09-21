{{ config(materialized='clone', alias='raw_payments_test') }}

 
{{ ref('raw_payments') }}