-- Gold layer: business-ready aggregates. Built in lab 01.

-- TODO (lab-01): Create the materialized view revenue_by_region_daily with order_date, region, order count and total revenue from orders_silver.

CREATE OR REFRESH MATERIALIZED VIEW orders_enriched
COMMENT "Orders joined with customer segment and product category"
AS SELECT
  o.*,
  c.segment,
  p.category
FROM orders_silver o
LEFT JOIN customers c USING (customer_id)
LEFT JOIN products p USING (product_id);
