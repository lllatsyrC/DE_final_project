WITH max_date AS (
    SELECT MAX(`date`) AS last_date
    FROM final_project.gold.actuals_with_target
)

SELECT
    g.`date`,
    SUM(g.sales) AS daily_sales,

    -- Payday marker (existing)
    CASE 
        WHEN MAX(g.is_payday) = TRUE THEN 1 
        ELSE 0 
    END AS payday_marker,

    -- Weekend marker (NEW)
    CASE 
        WHEN MAX(g.is_weekend) = TRUE THEN 1 
        ELSE 0 
    END AS weekend_marker

FROM final_project.gold.actuals_with_target g
CROSS JOIN max_date md
WHERE g.`date` BETWEEN DATE_SUB(md.last_date, 45) AND md.last_date
GROUP BY g.`date`
ORDER BY g.`date` ASC;