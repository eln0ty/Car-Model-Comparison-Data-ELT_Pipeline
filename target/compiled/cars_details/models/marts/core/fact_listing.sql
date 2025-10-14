




  
  


select
    md5(concat_ws('||', c.car_id::text, c._ingested_at::text)) as fact_id,
    c.car_id,
    d.car_sk,
    f.price,
    f.mileage,
    f.mileage_band,
    f.price_band,
    f.country,
    f.transmission,
    f.fuel_type,
    c._ingested_at
from "cars"."public"."int_car_features" f
join "cars"."public"."dim_car" d
  on d.make  = f.make
 and d.model = f.model
 and d.year  = f.year
join "cars"."public"."stg_car_details" c
  on c.car_id = f.car_id

  where c._ingested_at > '2025-10-05 05:02:52.960576+00:00'::timestamp
