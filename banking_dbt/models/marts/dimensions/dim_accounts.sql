{{ config(materialized='table') }}

WITH latest as (
select 
account_id, 
customer_id,
account_type,
balance,
currency,
created_at,
dbt_valid_from as effective_from,
dbt_valid_to as effective_to,
CASE WHEN dbt_valid_to is NULL then true else false end as is_current
from {{ ref('accounts_snapshot')}}
)

SELECT * FROM latest