WITH max_date AS (
    SELECT MAX(`date`) AS last_date
    FROM final_project.gold.actuals_with_target
),

family_sales AS (
    SELECT
        g.`date`,
        g.family,
        SUM(g.sales) AS total_sales,

        -- National holiday marker
        CASE WHEN MAX(g.is_national_holiday) = TRUE THEN 1 ELSE 0 END AS holiday_marker,

        -- Payday marker
        CASE WHEN MAX(g.is_payday) = TRUE THEN 1 ELSE 0 END AS payday_marker,

        -- Weekend marker
        CASE WHEN MAX(g.is_weekend) = TRUE THEN 1 ELSE 0 END AS weekend_marker

    FROM final_project.gold.actuals_with_target g
    CROSS JOIN max_date md
    WHERE g.family = 'GROCERY I'   -- change family for other tables
      AND g.`date` BETWEEN DATE_SUB(md.last_date, 364) AND md.last_date
    GROUP BY g.`date`, g.family
)

SELECT *
FROM family_sales
ORDER BY `date` ASC;


WITH max_date AS (
    SELECT MAX(`date`) AS last_date
    FROM final_project.gold.actuals_with_target
),

family_sales AS (
    SELECT
        g.`date`,
        g.family,
        SUM(g.sales) AS total_sales,

        -- National holiday marker
        CASE WHEN MAX(g.is_national_holiday) = TRUE THEN 1 ELSE 0 END AS holiday_marker,

        -- Payday marker
        CASE WHEN MAX(g.is_payday) = TRUE THEN 1 ELSE 0 END AS payday_marker,

        -- Weekend marker
        CASE WHEN MAX(g.is_weekend) = TRUE THEN 1 ELSE 0 END AS weekend_marker

    FROM final_project.gold.actuals_with_target g
    CROSS JOIN max_date md
    WHERE g.family = 'BEVERAGES'   -- change family for other tables
      AND g.`date` BETWEEN DATE_SUB(md.last_date, 364) AND md.last_date
    GROUP BY g.`date`, g.family
)

SELECT *
FROM family_sales
ORDER BY `date` ASC;


WITH max_date AS (
    SELECT MAX(`date`) AS last_date
    FROM final_project.gold.actuals_with_target
),

family_sales AS (
    SELECT
        g.`date`,
        g.family,
        SUM(g.sales) AS total_sales,

        -- National holiday marker
        CASE WHEN MAX(g.is_national_holiday) = TRUE THEN 1 ELSE 0 END AS holiday_marker,

        -- Payday marker
        CASE WHEN MAX(g.is_payday) = TRUE THEN 1 ELSE 0 END AS payday_marker,

        -- Weekend marker
        CASE WHEN MAX(g.is_weekend) = TRUE THEN 1 ELSE 0 END AS weekend_marker

    FROM final_project.gold.actuals_with_target g
    CROSS JOIN max_date md
    WHERE g.family = 'PRODUCE'   -- change family for other tables
      AND g.`date` BETWEEN DATE_SUB(md.last_date, 364) AND md.last_date
    GROUP BY g.`date`, g.family
)

SELECT *
FROM family_sales
ORDER BY `date` ASC;

WITH max_date AS (
    SELECT MAX(`date`) AS last_date
    FROM final_project.gold.actuals_with_target
),

family_sales AS (
    SELECT
        g.`date`,
        g.family,
        SUM(g.sales) AS total_sales,

        -- National holiday marker
        CASE WHEN MAX(g.is_national_holiday) = TRUE THEN 1 ELSE 0 END AS holiday_marker,

        -- Payday marker
        CASE WHEN MAX(g.is_payday) = TRUE THEN 1 ELSE 0 END AS payday_marker,

        -- Weekend marker
        CASE WHEN MAX(g.is_weekend) = TRUE THEN 1 ELSE 0 END AS weekend_marker

    FROM final_project.gold.actuals_with_target g
    CROSS JOIN max_date md
    WHERE g.family = 'CLEANING'   -- change family for other tables
      AND g.`date` BETWEEN DATE_SUB(md.last_date, 364) AND md.last_date
    GROUP BY g.`date`, g.family
)

SELECT *
FROM family_sales
ORDER BY `date` ASC;


WITH max_date AS (
    SELECT MAX(`date`) AS last_date
    FROM final_project.gold.actuals_with_target
),

family_sales AS (
    SELECT
        g.`date`,
        g.family,
        SUM(g.sales) AS total_sales,

        -- National holiday marker
        CASE WHEN MAX(g.is_national_holiday) = TRUE THEN 1 ELSE 0 END AS holiday_marker,

        -- Payday marker
        CASE WHEN MAX(g.is_payday) = TRUE THEN 1 ELSE 0 END AS payday_marker,

        -- Weekend marker
        CASE WHEN MAX(g.is_weekend) = TRUE THEN 1 ELSE 0 END AS weekend_marker

    FROM final_project.gold.actuals_with_target g
    CROSS JOIN max_date md
    WHERE g.family = 'DAIRY'   -- change family for other tables
      AND g.`date` BETWEEN DATE_SUB(md.last_date, 364) AND md.last_date
    GROUP BY g.`date`, g.family
)

SELECT *
FROM family_sales
ORDER BY `date` ASC;
