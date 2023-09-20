/*
File: ridership_with_holidays_order_by_casual_member_average.sql

This query provides insights into ride patterns and preferences for
"Member" and "Casual" users, allowing a comprehensive understanding
of user behavior throughout the year. By leveraging data from the 
"error_free_records" dataset and optional holiday information, the query
calculates counts and average counts of rides for both user types. 
User population sizes are considered, ensuring fair comparisons 
between segments. The analysis is organized by date, day of the 
year, day name, and potential holiday name, and ordered by average
casual riders in decending order.
*/

SELECT
    date_start AS date,
    day_of_year,
    name_of_day,
    COALESCE(td.holiday_name, '') AS holiday_name,
    TO_CHAR(COUNT(CASE WHEN member_casual = 'casual' THEN 1 END), '999,999,999') AS casual_riders_count,
    TO_CHAR(COUNT(CASE WHEN member_casual = 'member' THEN 1 END), '999,999,999') AS member_riders_count,
    ROUND(AVG(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END), 2) AS average_casual_riders,
    ROUND(AVG(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END), 2) AS average_member_riders
FROM
    user_data ud
LEFT JOIN temporal_data td ON ud.date_start = td.holiday_start_date
WHERE
    td.holiday_name <> ''
GROUP BY
    date_start, ud.day_of_year, ud.name_of_day, td.holiday_name
ORDER BY
    average_casual_riders DESC;
