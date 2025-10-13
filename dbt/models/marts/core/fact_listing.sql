{{ config(materialized='incremental', unique_key='fact_id') }}

{% set relation_exists = adapter.get_relation(
    database=this.database,
    schema=this.schema,
    identifier=this.identifier
) is not none %}

{% if relation_exists %}
  {% set max_loaded_query %}
      select coalesce(max(_ingested_at), '1900-01-01'::timestamp) as max_ts
      from {{ this }}
  {% endset %}
  {% set max_loaded = run_query(max_loaded_query).columns[0].values()[0] %}
{% else %}
  {% set max_loaded = '1900-01-01' %}
{% endif %}

select
    md5(concat_ws('||', c.car_id::text, c._ingested_at::text)) as fact_id,
    c.car_id,
    d.car_sk,
    f.price,
    f.mileage,
    f.mileage_band,
    f.price_band,
    f.country,
    f.transmission,
    f.fuel_type,
    c._ingested_at
from {{ ref('int_car_features') }} f
join {{ ref('dim_car') }} d
  on d.make  = f.make
 and d.model = f.model
 and d.year  = f.year
join {{ ref('stg_car_details') }} c
  on c.car_id = f.car_id
{% if is_incremental() and relation_exists %}
  where c._ingested_at > '{{ max_loaded }}'::timestamp
{% endif %}
