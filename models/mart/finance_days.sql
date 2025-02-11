select
    date_date
    ,COUNT(DISTINCT(orders_id))  AS nb_transactions
    ,ROUND(SUM(revenue),1) AS revenue
    ,ROUND(AVG(revenue),1) AS average_basket
    ,ROUND(SUM(operational_margin),1) AS operational_margin
    ,ROUND(SUM(purchase_cost),1) AS purchase_cost
    ,ROUND(SUM(shipping_fee),1) AS tot_shipping_fees
    ,ROUND(SUM(logcost),1) AS tot_log_cost
    ,SUM(quantity) AS tot_products_sold
FROM {{ ref('int_orders_operational') }}
GROUP BY date_date