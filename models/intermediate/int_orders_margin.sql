SELECT
    orders_id
    ,date_date
    ,SUM(revenue) AS revenue
    ,SUM(quantity) AS quantity
    ,SUM(quantity*purchase_price) AS purchase_cost
    ,SUM(revenue - (quantity*purchase_price)) AS margin
FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }}
JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }}
USING (products_id)
GROUP BY orders_id, date_date