WITH max_date AS (
    SELECT MAX(`date`) AS last_date
    FROM final_project.gold.actuals_with_target
),

sales_45_days AS (
    SELECT
        cluster,
        family,
        SUM(sales) AS total_sales,
        CASE
            WHEN cluster BETWEEN 1 AND 10 THEN 'California'
            ELSE 'Non-California'
        END AS group_name
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
        group_name,
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
        total_sales,
        group_name
    FROM ranked_sales
)

SELECT
    cluster,
    family_group AS family,
    SUM(total_sales) AS total_sales,
    group_name
FROM labeled_sales
GROUP BY cluster, family_group, group_name
ORDER BY group_name, cluster, total_sales DESC;
