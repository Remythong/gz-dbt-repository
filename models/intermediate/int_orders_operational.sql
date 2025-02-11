SELECT
    orders_id
    ,date_date
    ,(margin + shipping_fee) - (logcost + ship_cost) AS operational_margin
    ,quantity
    ,purchase_cost
    ,logcost
    ,ship_cost
    ,shipping_fee
    ,revenue
FROM {{ ref('int_orders_margin') }}
JOIN {{ ref('stg_gz_raw_data__raw_gz_ship') }}
USING(orders_id)