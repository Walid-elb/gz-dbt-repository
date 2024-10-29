with sales as (
    select 
        orders_id,
        sum(revenue) as total_revenue,
        sum(quantity) as total_quantity,
        sum(revenue - (quantity * purchase_price)) as margin
    from {{ ref('stg_gz_raw_data__raw_gz_sales') }} s
    join {{ ref('stg_gz_raw_data__raw_gz_product') }} p on s.pdt_id = p.products_id
    group by orders_id
),
shipping as (
    select 
        orders_id,
        sum(shipping_fee) as total_shipping_fee,
        sum(logCost) as total_log_cost,
        sum(ship_cost) as total_ship_cost
    from {{ ref('stg_gz_raw_data__raw_gz_ship') }}
    group by orders_id
)

select 
    s.orders_id,
    s.margin,
    sh.total_shipping_fee,
    sh.total_log_cost,
    sh.total_ship_cost,
    (s.margin + sh.total_shipping_fee - sh.total_log_cost - sh.total_ship_cost) as operational_margin
from sales s
join shipping sh on s.orders_id = sh.orders_id