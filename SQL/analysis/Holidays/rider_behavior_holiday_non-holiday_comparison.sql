/*
File: rider_behavior_holiday_non-holiday_comparison.sql

Average ridership by group type on holidays and non-holidays.
*/

SELECT
    CASE WHEN td.holiday_name IS NOT NULL THEN 'Holiday' ELSE 'Non-Holiday' END AS day_type,
    ROUND(AVG(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END), 4) AS avg_casual_riders,
    ROUND(AVG(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END), 4) AS avg_member_riders
FROM
    user_data ud
LEFT JOIN temporal_data td ON ud.date_start = td.holiday_start_date
GROUP BY
    day_type
ORDER BY
    day_type;
