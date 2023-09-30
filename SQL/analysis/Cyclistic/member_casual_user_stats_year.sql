/*
File: member_casual_user_stats_year.sql

Yearly focus on total counts of segmented groups, including percentage differences.
*/

SELECT
    EXTRACT(YEAR FROM started_at) AS year,
    TO_CHAR(SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END), '999,999,999') AS member_count,
    TO_CHAR(SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END), '999,999,999') AS casual_count,
    ROUND(
        (
            (
                SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) - 
                SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END)
            )::numeric /
            SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END)
        ) * 100,
        2
    ) AS percentage_difference
FROM user_data
GROUP BY EXTRACT(YEAR FROM started_at)
ORDER BY year;
