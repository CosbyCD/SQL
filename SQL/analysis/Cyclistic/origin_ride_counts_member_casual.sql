/*
File: origin_ride_counts_member.sql

Counts rides by start station, by segmented groups. Orders by start station with descending ride counts.
*/

SELECT
    start_station_name,
    TO_CHAR(SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END), '9,999,999') AS member_ride_count,
    TO_CHAR(SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END), '9,999,999') AS casual_ride_count
FROM user_data
WHERE start_station_name IS NOT NULL
GROUP BY start_station_name
ORDER BY casual_ride_count DESC;
