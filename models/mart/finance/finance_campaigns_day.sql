select
    date_date
    ,operational_margin - ads_cost AS ads_margin
    ,average_basket
    ,operational_margin
    ,ads_cost
    ,impression
    ,click
    ,quantity
    ,revenue
    ,purchase_cost
    ,margin
    ,shipping_fee
    ,logcost
    ,ship_cost
FROM {{ ref('finance_days') }}
JOIN {{ ref('ints_campaign_days') }}
USING(date_date)