WITH max_date AS (
    SELECT MAX(`date`) AS last_date
    FROM final_project.gold.actuals_with_target
),

weekend_sales AS (
    SELECT
        g.family,
        SUM(g.sales) AS total_sales
    FROM final_project.gold.actuals_with_target g
    CROSS JOIN max_date md
    WHERE g.`date` BETWEEN DATE_SUB(md.last_date, 45) AND md.last_date
      AND g.is_weekend = TRUE  -- only weekends
    GROUP BY g.family
),

ranked_sales AS (
    SELECT
        family,
        total_sales,
        ROW_NUMBER() OVER (ORDER BY total_sales DESC) AS rank
    FROM weekend_sales
),

labeled_sales AS (
    SELECT
        CASE
            WHEN rank <= 5 THEN family
            ELSE 'Other'
        END AS family_group,
        total_sales
    FROM ranked_sales
)

SELECT
    family_group AS family,
    SUM(total_sales) AS total_sales
FROM labeled_sales
GROUP BY family_group
ORDER BY total_sales DESC;