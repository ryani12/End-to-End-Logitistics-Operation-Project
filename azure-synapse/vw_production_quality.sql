CREATE OR ALTER VIEW operations_schema.vw_production_quality_detailed AS
WITH production_performance AS (
    SELECT 
        date,
        AVG(production_line_efficiency) AS avg_production_efficiency,
        MAX(production_line_efficiency) AS max_production_efficiency,
        MIN(production_line_efficiency) AS min_production_efficiency,
        AVG(downtime_hours) AS avg_downtime,
        AVG(yield_rate) AS avg_yield_rate
    FROM 
        production_quality_control
    GROUP BY 
        date
),
defect_analysis AS (
    SELECT 
        date,
        AVG(defect_rate) AS avg_defect_rate,
        MAX(defect_rate) AS max_defect_rate,
        MIN(defect_rate) AS min_defect_rate,
        CASE 
            WHEN AVG(defect_rate) < 1 THEN 'Excellent'
            WHEN AVG(defect_rate) BETWEEN 1 AND 3 THEN 'Good'
            ELSE 'Needs Improvement'
        END AS defect_performance_band
    FROM 
        production_quality_control
    GROUP BY 
        date
)
SELECT 
    pp.date,
    pp.avg_production_efficiency,
    pp.max_production_efficiency,
    pp.min_production_efficiency,
    pp.avg_downtime,
    pp.avg_yield_rate,
    da.avg_defect_rate,
    da.max_defect_rate,
    da.min_defect_rate,
    da.defect_performance_band
FROM 
    production_performance pp
JOIN 
    defect_analysis da ON pp.date = da.date;
     
