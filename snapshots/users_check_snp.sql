{% snapshot users_check_snp%}

{{
    config(
        target_schema='snapshots',
        unique_key='DNI',
        strategy='check',
        check_cols=['Nombre', 'email'],
        hard_deletes='new_record'

    )
}}

SELECT
    Nombre,
    DNI,
    email,
    fecha_alta_sistema
FROM {{ source('GOOGLE', 'USERS') }}

{% endsnapshot %}