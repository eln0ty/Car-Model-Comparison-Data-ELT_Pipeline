
    
    

with all_values as (

    select
        transmission as value_field,
        count(*) as n_records

    from "cars"."public_raw"."car_details"
    group by transmission

)

select *
from all_values
where value_field not in (
    'manual','automatic','cvt'
)


