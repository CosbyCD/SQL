/*
File: origin_ride_counts_by_start_station_all.sql

Provides a list of start stations and their respective ride counts, ordered in descending order of ride counts.
*/

SELECT start_station_name, TO_CHAR(COUNT(start_station_name), '9,999,999') AS origin_ride_count
FROM user_data
GROUP BY start_station_name
ORDER BY origin_ride_count DESC;
