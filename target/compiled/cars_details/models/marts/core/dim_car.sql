

select
  md5(concat_ws('||', make, model, year)) as car_sk,
  make, model, year
from "cars"."public"."int_car_features"
group by 2,3,4