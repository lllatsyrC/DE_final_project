WITH max_date AS (
    SELECT MAX(`date`) AS last_date
    FROM final_project.gold.actuals_with_target
)
SELECT
    g.`date`,
    SUM(g.sales) AS daily_sales
FROM final_project.gold.actuals_with_target g
CROSS JOIN max_date md
WHERE g.`date` BETWEEN DATE_SUB(md.last_date, COALESCE(TRY_CAST(:time_window_days AS INT), 45))
                  AND md.last_date
GROUP BY g.`date`
ORDER BY g.`date` ASC;
