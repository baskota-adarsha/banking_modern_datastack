{{ config(materialized='table') }}

WITH latest as (
select 
customer_id,
first_name,
last_name,
email,
created_at,
dbt_valid_from as effective_from,
dbt_valid_to as effective_to,
CASE WHEN dbt_valid_to is NULL then true else false end as is_current
from {{ ref('customers_snapshot')}}
)

SELECT * FROM latest