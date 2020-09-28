with 

orders as (

    select * from {{ ref('stg_orders') }}

),

payments as (

    select * from {{ ref('stg_payments') }} where coalesce(status,'@') = 'success'

),

final as (

    select
        orders.order_id as order_id, 
        orders.customer_id as customer_id,
        sum(coalesce(amount,0)) * 0.01 as payment

    from orders
    left join payments on orders.order_id = payments.orderid
    group by orders.order_id, orders.customer_id

)

select * from final