with payments as (

    select 
        id as payment_id,
        orderid as order_id,
        amount,
        status
    from {{ source('dbt_stripe', 'payment')}}
)
select * from payments