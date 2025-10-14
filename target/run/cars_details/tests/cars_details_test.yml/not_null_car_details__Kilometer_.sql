
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select "Kilometer"
from "cars"."public_raw"."car_details"
where "Kilometer" is null



  
  
      
    ) dbt_internal_test