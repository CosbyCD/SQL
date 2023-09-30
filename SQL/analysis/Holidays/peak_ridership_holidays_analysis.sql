/*
File: peak_ridership_holidays_analysis.sql

Total user counts for each holiday, segmented by group.
*/

SELECT
    td.holiday_name,
    TO_CHAR(COUNT(CASE WHEN ud.member_casual = 'casual' THEN 1 END) + COUNT(CASE WHEN ud.member_casual = 'member' THEN 1 END), '999,999') AS total_ridership
FROM
    user_data ud
LEFT JOIN temporal_data td ON ud.date_start = td.holiday_start_date
WHERE
    td.holiday_name IS NOT NULL
GROUP BY
    td.holiday_name
ORDER BY
    total_ridership DESC;
