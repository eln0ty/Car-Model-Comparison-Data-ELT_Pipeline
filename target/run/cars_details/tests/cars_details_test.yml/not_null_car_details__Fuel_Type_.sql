
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select "Fuel_Type"
from "cars"."public_raw"."car_details"
where "Fuel_Type" is null



  
  
      
    ) dbt_internal_test