SELECT
    order_id,
    SUM(payment_amount) as total_amount
FROM {{ ref('stg_stripe__payment') }}
group by 1
having sum(payment_amount) < 0