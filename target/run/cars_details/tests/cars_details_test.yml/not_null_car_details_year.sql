
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select year
from "cars"."public_raw"."car_details"
where year is null



  
  
      
    ) dbt_internal_test