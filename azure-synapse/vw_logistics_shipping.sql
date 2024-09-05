CREATE OR ALTER VIEW operations_schema.vw_logistics_shipping_detailed AS
WITH shipping_performance AS (
    SELECT 
        date,
        AVG(shipping_time_days) AS avg_shipping_time,
        AVG(delivery_accuracy) AS avg_delivery_accuracy,
        SUM(returns) AS total_returns,
        SUM(customer_complaints) AS total_customer_complaints
    FROM 
        logistics_shipping
    GROUP BY 
        date
),
cost_efficiency AS (
    SELECT 
        date,
        SUM(transportation_costs) AS total_transportation_costs,
        SUM(returns + customer_complaints) / NULLIF(SUM(transportation_costs), 0) AS cost_performance_index
    FROM 
        logistics_shipping
    GROUP BY 
        date
)
SELECT 
    sp.date,
    sp.avg_shipping_time,
    sp.avg_delivery_accuracy,
    sp.total_returns,
    sp.total_customer_complaints,
    ce.total_transportation_costs,
    ce.cost_performance_index
FROM 
    shipping_performance sp
JOIN 
    cost_efficiency ce ON sp.date = ce.date;
