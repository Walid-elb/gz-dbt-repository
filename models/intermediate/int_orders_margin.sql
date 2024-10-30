select orders_id, date_date, 
SUM (revenue) AS revenue,
SUM (quantity) AS quantity,
sum (quantity * purchase_price) as purchase_cost,
sum (revenue - (quantity * purchase_price)) as margin
from {{ ref('int_sales_margin') }}
GROUP BY orders_id, date_date





