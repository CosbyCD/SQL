/*
File: rider_holiday_breakdown.sql

Total counts for each holiday, segmented by user type.
*/

SELECT
    td.holiday_name,
    TO_CHAR(COUNT(CASE WHEN member_casual = 'casual' THEN 1 END), '9,999,999') AS casual_riders_count,
    TO_CHAR(COUNT(CASE WHEN member_casual = 'member' THEN 1 END), '9,999,999') AS member_riders_count
FROM
    user_data ud
LEFT JOIN temporal_data td ON ud.date_start = td.holiday_start_date
WHERE
    td.holiday_name IS NOT NULL
GROUP BY
    td.holiday_name
ORDER BY
    td.holiday_name;
