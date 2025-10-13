{{ config(materialized='table') }}

select
    date_day as date,
    extract(year  from date_day)::int  as year,
    extract(month from date_day)::int  as month,
    extract(day   from date_day)::int  as day,
    to_char(date_day,'YYYYMMDD')::int  as date_key
from (
    {{ dbt_utils.date_spine(
        datepart='day',
        start_date="'2000-01-01'::date",
        end_date="(current_date + interval '1 year')::date"
    ) }}
) as spine
