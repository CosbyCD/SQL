/*
File: temperature_precipitation_ridership_analysis.sql

Provides segmented rider counts based on temperature range and precipitation status.
*/

SELECT
    temperature_range,
    precipitation_status,
    TO_CHAR(COUNT(CASE WHEN member_casual = 'casual' THEN 1 END), '999,999') AS casual_riders_count,
    TO_CHAR(COUNT(CASE WHEN member_casual = 'member' THEN 1 END), '999,999') AS member_riders_count
FROM (
    SELECT
        CASE
            WHEN td.temp < 50 THEN 'Less than 50°F'
            WHEN td.temp >= 50 AND td.temp < 60 THEN '50-59°F'
            WHEN td.temp >= 60 AND td.temp < 70 THEN '60-69°F'
            WHEN td.temp >= 70 AND td.temp < 80 THEN '70-79°F'
            ELSE '80°F and above'
        END AS temperature_range,
        CASE
            WHEN td.precip > 0 THEN 'Precipitation'
            ELSE 'No Precipitation'
        END AS precipitation_status,
        ud.member_casual
    FROM
        user_data ud
    LEFT JOIN temporal_data td ON ud.date_start = td.date_w
    WHERE
        td.holiday_name IS NOT NULL
) AS temp_precip_data
GROUP BY
    temperature_range, precipitation_status
ORDER BY
    temperature_range, precipitation_status;
