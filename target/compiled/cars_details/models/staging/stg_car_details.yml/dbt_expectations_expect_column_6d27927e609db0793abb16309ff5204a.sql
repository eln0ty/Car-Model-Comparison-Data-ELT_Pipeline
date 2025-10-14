






    with grouped_expression as (
    select
        
        
    
  
( 1=1 and year >= 1980 and year <= 2030
)
 as expression


    from "cars"."public"."stg_car_details"
    

),
validation_errors as (

    select
        *
    from
        grouped_expression
    where
        not(expression = true)

)

select *
from validation_errors







