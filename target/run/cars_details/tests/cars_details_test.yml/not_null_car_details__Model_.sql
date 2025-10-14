
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select "Model"
from "cars"."public_raw"."car_details"
where "Model" is null



  
  
      
    ) dbt_internal_test