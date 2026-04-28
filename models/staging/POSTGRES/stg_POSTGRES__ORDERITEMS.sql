{{ config(materialized='view')}}

with 

source as (

    select * from {{ source('POSTGRES', 'ORDERITEMS') }}

),

renamed as (

    select
        order_id,
        product_id,
        quantity,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed