
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select "Make"
from "cars"."public_raw"."car_details"
where "Make" is null



  
  
      
    ) dbt_internal_test