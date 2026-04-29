{{ config(
    materialized='incremental',
    unique_key='product_id',
) }}

with source as (

    select * 
    from {{ source('GOOGLE', 'BUDGET') }}
    
    {% if is_incremental() %}
    where _fivetran_synced > (
        select max(_fivetran_synced) from {{ this }}
    )
    {% endif %}

),

renamed as (

    select
        _row,
        quantity,
        month,
        product_id,
        _fivetran_synced
    from source

)


select * from renamed