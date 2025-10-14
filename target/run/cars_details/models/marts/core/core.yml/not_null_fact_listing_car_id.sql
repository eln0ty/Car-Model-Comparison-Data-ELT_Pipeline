
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select car_id
from "cars"."public"."fact_listing"
where car_id is null



  
  
      
    ) dbt_internal_test