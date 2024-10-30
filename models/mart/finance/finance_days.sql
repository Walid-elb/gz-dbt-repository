SELECT
    date_date,
    COUNT(orders_id) AS nb_transactions,
    ROUND(SUM(revenue),2) AS revenue,
    ROUND(SUM(revenue)/COUNT(orders_id),2) AS average_basket,
    ROUND(SUM(operational_margin),2) AS operational_margin,
    ROUND(SUM(purchase_cost),2) AS purchase_cost,
    ROUND(SUM(shipping_fee),2) AS shipping_fee,
    ROUND(SUM(logcost),2) AS logcost,
    ROUND(SUM(quantity),2) AS quantity
FROM {{ref("int_orders_operational")}}
GROUP BY all