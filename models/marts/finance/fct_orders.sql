with orders as (
    select * from {{ ref('stg_jaffle_shop__orders') }}
),

payments as (
    select * from {{ ref('stg_stripe__payments') }}
),

order_payments as (
    SELECT 
        order_id,
        sum(CASE when payment_status = 'success' then payment_amount end) as amount

    FROM payments
    group by 1
),

final as (

    select
        orders.order_id
        ,orders.customer_id
        ,orders.order_date
        ,coalesce(order_payments.amount, 0) as amount
    FROM orders
    LEFT JOIN order_payments using (order_id)
)
SELECT *
FROM final