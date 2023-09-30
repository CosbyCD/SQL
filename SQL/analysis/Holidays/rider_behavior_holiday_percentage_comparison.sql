/*
File: rider_behavior_holiday_percentage_comparison.sql

Average percentage of ridership by group type on holidays.
*/


SELECT
    td.holiday_name,
    ROUND(AVG(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) * 100) AS avg_casual_riders_percentage,
    ROUND(AVG(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) * 100) AS avg_member_riders_percentage
FROM
    user_data ud
LEFT JOIN temporal_data td ON ud.date_start = td.holiday_start_date
WHERE
    td.holiday_name IS NOT NULL
GROUP BY
    td.holiday_name
ORDER BY
    avg_casual_riders_percentage DESC;
