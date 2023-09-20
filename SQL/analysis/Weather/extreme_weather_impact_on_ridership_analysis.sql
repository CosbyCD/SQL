/*
File: extreme_weather_impact_on_ridership_analysis.sql

This query delves into the impact of extreme weather conditions 
on ridership behavior by examining patterns during exceptionally 
hot, cold, or stormy days. By categorizing data based on temperature
and precipitation, the query calculates the average percentage of 
casual and member riders for each extreme weather type. 
*/

SELECT
    extreme_weather_type,
    TO_CHAR(AVG(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) * 100, '999.99') || '%' AS avg_casual_riders_percentage,
    TO_CHAR(AVG(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) * 100, '999.99') || '%' AS avg_member_riders_percentage
FROM (
    SELECT
        CASE
            WHEN td.temp >= 80 THEN 'Hot'
            WHEN td.temp < 50 THEN 'Cold'
            WHEN td.precip > 0 THEN 'Stormy'
            ELSE 'Normal'
        END AS extreme_weather_type,
        ud.member_casual
    FROM
        temporal_data td
    LEFT JOIN user_data ud ON td.date_w = ud.date_start
    WHERE
        td.holiday_name IS NOT NULL
) AS extreme_weather_data
GROUP BY
    extreme_weather_type
ORDER BY
    avg_casual_riders_percentage DESC;
