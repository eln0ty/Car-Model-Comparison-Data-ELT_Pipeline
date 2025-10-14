

select
  md5(concat_ws('||',
    coalesce(make,''), 
    coalesce(model,''), 
    coalesce(year::text,''), 
    coalesce(location,''), 
    coalesce(price::text,''), 
    coalesce(kilometer::text,''), 
    coalesce(fuel_type,''), 
    coalesce(transmission,'')
  )) as car_id,
  lower(trim(make)) as make,
  lower(trim(model)) as model,
  cast(year as int) as year,
  cast(price as numeric) as price,
  (kilometer)::int as mileage,
  trim(color) as color,
  trim(transmission) as transmission,
  trim(fuel_type) as fuel_type,
  trim(location) as country,
  current_timestamp as _ingested_at
from "cars"."public_raw"."car_details"