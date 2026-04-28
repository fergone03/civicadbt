{{ config(materialized='view')}}


with 

source as (

    select * from {{ source('POSTGRES', 'PRODUCTS') }}

),

renamed as (

    select
        product_id,
        price,
        name,
        inventory,
        _fivetran_deleted,
        _fivetran_synced

    from source

)

select * from renamed