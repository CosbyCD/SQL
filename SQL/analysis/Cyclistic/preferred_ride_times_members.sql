/*
File: preferred_ride_times_members.sql

Analyzes member user ride patterns by start time, categorizing into periods and counting rides. Presents top time slots.
*/

SELECT CASE
           WHEN EXTRACT(HOUR FROM started_at) = 0 THEN '12am'
           WHEN EXTRACT(HOUR FROM started_at) = 12 THEN '12pm'
           WHEN EXTRACT(HOUR FROM started_at) < 12 THEN TO_CHAR(started_at, 'HHam')
           ELSE TO_CHAR(started_at, 'HHpm')
       END AS member_ride_times,
       TO_CHAR(COUNT(*), '9,999,999') AS member_ride_counts
FROM user_data
WHERE member_casual = 'member'
GROUP BY member_ride_times
ORDER BY member_ride_counts DESC;

