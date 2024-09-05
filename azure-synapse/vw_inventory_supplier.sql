CREATE OR ALTER VIEW operations_schema.vw_inventory_supplier_detailed AS
WITH inventory_trends AS (
    SELECT 
        date,
        AVG(inventory_level) AS avg_inventory_level,
        LAG(AVG(inventory_level), 1) OVER (ORDER BY date) AS prev_inventory_level,
        AVG(order_fulfillment_rate) AS avg_fulfillment_rate,
        LAG(AVG(order_fulfillment_rate), 1) OVER (ORDER BY date) AS prev_fulfillment_rate
    FROM 
        inventory_supplier_performance
    GROUP BY 
        date
),
supplier_performance_trends AS (
    SELECT 
        date,
        AVG(supplier_performance) AS avg_supplier_performance,
        LAG(AVG(supplier_performance), 1) OVER (ORDER BY date) AS prev_supplier_performance
    FROM 
        inventory_supplier_performance
    GROUP BY 
        date
)
SELECT 
    it.date,
    it.avg_inventory_level,
    it.avg_fulfillment_rate,
    it.avg_inventory_level - it.prev_inventory_level AS inventory_change,
    it.avg_fulfillment_rate - it.prev_fulfillment_rate AS fulfillment_change,
    spt.avg_supplier_performance,
    spt.avg_supplier_performance - spt.prev_supplier_performance AS supplier_performance_change
FROM 
    inventory_trends it
JOIN 
    supplier_performance_trends spt ON it.date = spt.date;
