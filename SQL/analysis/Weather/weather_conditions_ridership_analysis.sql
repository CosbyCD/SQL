/*
File: weather_conditions_ridership_analysis.sql

This query analyzes the impact of specific weather conditions on ridership patterns.
It categorizes the data based on different weather conditions and calculates the count
of casual and member riders for each weather condition category.
The output provides insights into how different weather conditions influence rider behavior.
*/

SELECT
    conditions,
    TO_CHAR(COUNT(CASE WHEN member_casual = 'casual' THEN 1 END), '999,999') AS casual_riders_count,
    TO_CHAR(COUNT(CASE WHEN member_casual = 'member' THEN 1 END), '999,999') AS member_riders_count
FROM (
    SELECT
        CASE
            WHEN td.conditions IS NULL THEN 'Unknown'
            ELSE td.conditions
        END AS conditions,
        ud.member_casual
    FROM
        user_data ud
    LEFT JOIN temporal_data td ON ud.date_start = td.date_w
    WHERE
        td.holiday_name IS NOT NULL
) AS weather_conditions_data
GROUP BY
    conditions
ORDER BY
    conditions;
