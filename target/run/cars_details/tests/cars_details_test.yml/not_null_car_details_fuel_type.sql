
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select fuel_type
from "cars"."public_raw"."car_details"
where fuel_type is null



  
  
      
    ) dbt_internal_test