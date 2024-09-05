CREATE OR ALTER VIEW operations_schema.vw_workforce_productivity_detailed AS
WITH productivity_metrics AS (
    SELECT 
        employee_id,
        date,
        AVG(employee_productivity) AS avg_productivity,
        AVG(labor_costs) AS avg_labor_costs,
        AVG(hours_worked) AS avg_hours_worked
    FROM 
        workforce_productivity
    GROUP BY 
        employee_id, date
),
performance_ratios AS (
    SELECT 
        employee_id,
        date,
        SUM(employee_productivity) / NULLIF(SUM(hours_worked), 0) AS productivity_per_hour,
        SUM(employee_productivity) / NULLIF(SUM(labor_costs), 0) AS productivity_per_cost
    FROM 
        workforce_productivity
    GROUP BY 
        employee_id, date
)
SELECT 
    pm.employee_id,
    pm.date,
    pm.avg_productivity,
    pm.avg_labor_costs,
    pm.avg_hours_worked,
    pr.productivity_per_hour,
    pr.productivity_per_cost
FROM 
    productivity_metrics pm
JOIN 
    performance_ratios pr 
    ON pm.employee_id = pr.employee_id AND pm.date = pr.date;
