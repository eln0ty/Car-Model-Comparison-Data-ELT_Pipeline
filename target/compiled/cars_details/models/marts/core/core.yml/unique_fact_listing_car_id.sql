
    
    

select
    car_id as unique_field,
    count(*) as n_records

from "cars"."public"."fact_listing"
where car_id is not null
group by car_id
having count(*) > 1


