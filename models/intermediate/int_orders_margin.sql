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

select orders_id, date_date, 
SUM (quantity) AS quantity,
sum (s.quantity * p.purchase_price) as purchase_cost,
sum (s.revenue - (s.quantity * p.purchase_price)) as margin
from sales s
join products p on s.pdt_id = p.products_id
GROUP BY orders_id, date_date