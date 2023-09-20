/*
File: humidity_impact_on_ridership_analysis.sql

This query investigates the relationship between humidity
levels and ridership preferences. By grouping ridership 
counts based on humidity ranges, it offers insights into 
how humidity might impact the preferences of casual and 
member riders. The analysis helps to identify any potential
correlations between humidity levels and ridership behavior. 
*/

SELECT
    humidity_range,
    TO_CHAR(COUNT(CASE WHEN member_casual = 'casual' THEN 1 END), '999,999') AS casual_riders_count,
    TO_CHAR(COUNT(CASE WHEN member_casual = 'member' THEN 1 END), '999,999') AS member_riders_count
FROM (
    SELECT
        CASE
            WHEN td.humidity < 30 THEN 'Less than 30%'
            WHEN td.humidity >= 30 AND td.humidity < 50 THEN '30-49%'
            WHEN td.humidity >= 50 AND td.humidity < 70 THEN '50-69%'
            WHEN td.humidity >= 70 THEN '70% and above'
        END AS humidity_range,
        ud.member_casual
    FROM
        temporal_data td
    LEFT JOIN user_data ud ON td.date_w = ud.date_start
    WHERE
        td.holiday_name IS NOT NULL
) AS humidity_data
GROUP BY
    humidity_range
ORDER BY
    humidity_range;
