with sales as (
    select 
        * 
    from {{ ref('stg_gz_raw_data__raw_gz_sales') }}
),
products as (
    select 
        * 
    from {{ ref('stg_gz_raw_data__raw_gz_product') }}
)

select 
    s.orders_id,
    s.pdt_id,
    s.revenue,
    s.quantity,
    p.purchase_price,
    (s.quantity * p.purchase_price) as purchase_cost,
    (s.revenue - (s.quantity * p.purchase_price)) as margin
from sales s
join products p on s.pdt_id = p.products_id
