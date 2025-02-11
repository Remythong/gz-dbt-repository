WITH aggreg_turnover AS (
SELECT
    products_id
    ,SUM(revenue) AS turnover
    ,SUM(quantity) AS quantity
FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }}
GROUP BY products_id
)

SELECT
    products_id
    ,purchase_price
    ,quantity
    ,quantity*purchase_price AS purchase_cost
    ,turnover
    ,turnover - (quantity*purchase_price) AS margin
FROM aggreg_turnover AS aggreg
JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }} AS products
USING (products_id)
