{{
    config(
        materialized='view'
    )
}}

with tripdata as 
(
  select *
  from {{ source('staging','fhv_tripdata') }}
)
select
    -- identifiers
    {{ dbt_utils.generate_surrogate_key(['dispatching_base_num', 'pickup_datetime']) }} as tripid,
    {{ dbt.safe_cast("dispatching_base_num", api.Column.translate_type("string")) }} as dispatching_base_num,

    
    -- timestamps
    cast(pickup_datetime as timestamp) as pickup_datetime,
    cast(dropOff_datetime as timestamp) as dropoff_datetime,

    -- payment info
    cast(PUlocationID as integer) as pickup_locationid,
    cast(DOlocationID as integer) as dropoff_locationid,
    cast(SR_Flag as integer) as SR_Flag,
    cast(Affiliated_base_number as string) as Affiliated_base_number
from tripdata
where extract(year from cast(pickup_datetime as timestamp)) = 2019