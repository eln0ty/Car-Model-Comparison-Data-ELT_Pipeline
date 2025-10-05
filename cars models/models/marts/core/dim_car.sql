{{ config(materialized='table') }}

select
  {{ generate_surrogate_key(['make','model','year']) }} as car_sk,
  make, model, year
from {{ ref('int_car_features') }}
group by 2,3,4
