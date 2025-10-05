{{ config(materialized='table') }}

select
  car_id,
  make,
  model,
  year,
  price,
  mileage,
  case when mileage is null then 'unknown'
       when mileage < 20000 then 'low'
       when mileage < 100000 then 'medium'
       else 'high' end as mileage_band,
  case when price < 5000 then 'budget'
       when price < 20000 then 'mid'
       else 'premium' end as price_band,
  country,
  transmission,
  fuel_type
from {{ ref('stg_car_details') }}
