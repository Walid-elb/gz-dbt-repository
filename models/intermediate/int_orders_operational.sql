select
    s.orders_id,
    s.margin,
    s.date_date,
    s.revenue,
    sh.shipping_fee,
    sh.logcost,
    sh.ship_cost,
    purchase_cost,
    quantity,
    (s.margin + sh.shipping_fee - sh.logcost - sh.ship_cost) as operational_margin
from {{ ref("int_orders_margin") }} as s
join {{ ref("stg_gz_raw_data__raw_gz_ship") }} as sh using (orders_id)
