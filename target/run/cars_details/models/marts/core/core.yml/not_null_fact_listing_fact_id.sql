
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select fact_id
from "cars"."public"."fact_listing"
where fact_id is null



  
  
      
    ) dbt_internal_test