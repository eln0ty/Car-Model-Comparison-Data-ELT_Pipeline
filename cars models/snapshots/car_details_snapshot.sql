{% snapshot car_details_snapshot %}
{{
  config(
    target_schema='snapshots',
    unique_key='row_id',
    strategy='check',
    check_cols=[
      'make','model','year','price','kilometer',
      'color','transmission','fuel_type','location',
      'owner','seller_type'
    ]
  )
}}

select
  md5(concat_ws('||',
    coalesce(make,''), coalesce(model,''), coalesce(year::text,''),
    coalesce(location,''), coalesce(owner,''), coalesce(seller_type,''),
    coalesce(transmission,''), coalesce(fuel_type,''), coalesce(color,''),
    coalesce(kilometer::text,'')
  )) as row_id,
  *
from {{ ref('car_details') }}

{% endsnapshot %}

'''
dbt clean
dbt deps
dbt seed
dbt snapshot
dbt run
dbt test --show-all-deprecations
'''