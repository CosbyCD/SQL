/*
File: count_riders_per_day_yearly.sql

Yearly ride trends: segmented duration, ride count variations, user engagement patterns by day.
*/

SELECT
    TO_CHAR(started_at, 'Day') AS day_of_week,
    REPLACE(TO_CHAR(SUM(CASE WHEN member_casual = 'member' 
						THEN 1 ELSE 0 END), '999,999'), ',', ',') AS member_ride_count,
    REPLACE(TO_CHAR(SUM(CASE WHEN member_casual = 'casual' 
						THEN 1 ELSE 0 END), '999,999'), ',', ',') AS casual_ride_count,
    REPLACE(TO_CHAR(ROUND(((SUM(CASE WHEN member_casual = 'member' 
								THEN 1 ELSE 0 END) - SUM(CASE WHEN member_casual = 'casual' 
								THEN 1 ELSE 0 END))::numeric / SUM(CASE WHEN member_casual = 'member' 
								THEN 1 ELSE 0 END)) * 100, 2), '999,999.99'), ',', ',') AS percent_difference
FROM
    user_data
GROUP BY
    TO_CHAR(started_at, 'Day')
ORDER BY
    EXTRACT(DOW FROM MIN(started_at));
