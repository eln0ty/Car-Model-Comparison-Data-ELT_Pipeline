
    
    

with all_values as (

    select
        "Transmission" as value_field,
        count(*) as n_records

    from "cars"."public_raw"."car_details"
    group by "Transmission"

)

select *
from all_values
where value_field not in (
    'Manual','Automatic'
)


