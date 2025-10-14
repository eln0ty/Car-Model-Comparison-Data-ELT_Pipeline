
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    fate_id as unique_field,
    count(*) as n_records

from "cars"."public"."fact_listing"
where fate_id is not null
group by fate_id
having count(*) > 1



  
  
      
    ) dbt_internal_test