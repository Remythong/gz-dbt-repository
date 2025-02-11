SELECT
    date_date
    ,orders_id
    ,(margin + shipping_fee) - (logcost + ship_cost) AS operational_margin
FROM {{ ref('int_orders_margin') }}
JOIN {{ ref('stg_gz_raw_data__raw_gz_ship') }}
USING(orders_id)