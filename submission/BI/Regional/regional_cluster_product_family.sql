-- Top 5 product families per cluster + Other (last 45 days)
WITH max_date AS (
    SELECT MAX(`date`) AS last_date
    FROM final_project.gold.actuals_with_target
),

sales_45_days AS (
    SELECT
        cluster,           -- group by cluster now
        family,
        SUM(sales) AS total_sales
    FROM final_project.gold.actuals_with_target g
    CROSS JOIN max_date md
    WHERE g.`date` BETWEEN DATE_SUB(md.last_date, 45) AND md.last_date
    GROUP BY cluster, family
),

ranked_sales AS (
    SELECT
        cluster,
        family,
        total_sales,
        ROW_NUMBER() OVER (
            PARTITION BY cluster 
            ORDER BY total_sales DESC
        ) AS rank_in_cluster
    FROM sales_45_days
),

labeled_sales AS (
    SELECT
        cluster,
        CASE 
            WHEN rank_in_cluster <= 5 THEN family
            ELSE 'Other'
        END AS family_group,
        total_sales
    FROM ranked_sales
)

SELECT
    cluster,
    family_group AS family,
    SUM(total_sales) AS total_sales
FROM labeled_sales
GROUP BY cluster, family_group
ORDER BY cluster, total_sales DESC;
