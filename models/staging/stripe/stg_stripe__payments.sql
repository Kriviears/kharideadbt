SELECT
    ID as payment_id,
	ORDERID as order_id,
	PAYMENTMETHOD as payment_method,
	STATUS as payment_status,
	AMOUNT as payment_amount,
	CREATED as payment_created,
    _BATCHED_AT,
FROM {{ source('stripe', 'payment') }}