{{ config(materialized='table') }}

with source_data as (

    select 
    json_value(_airbyte_data,'$."trace_id"' ) as trace_id,
    json_value(_airbyte_data, '$."name"' ) as `name`,
    json_value(_airbyte_data, '$."_id"' ) as _id

from mariadb._airbyte_raw_test2

)

select *
from source_data