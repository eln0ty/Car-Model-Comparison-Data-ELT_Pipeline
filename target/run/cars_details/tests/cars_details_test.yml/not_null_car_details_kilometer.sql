
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select kilometer
from "cars"."public_raw"."car_details"
where kilometer is null



  
  
      
    ) dbt_internal_test