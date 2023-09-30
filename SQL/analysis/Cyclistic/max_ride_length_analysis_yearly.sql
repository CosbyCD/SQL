/*
File: max_ride_length_analysis_yearly.sql

Ride length statistics for "Member" and "Casual" users over a year,
which is normalized by the user count to remove bias.
*/


WITH MaxRideLengths AS (
    SELECT 
        CASE 
            WHEN member_casual = 'member' THEN 'Member'
            WHEN member_casual = 'casual' THEN 'Casual'
        END AS user_type,
        SUM(EXTRACT(EPOCH FROM (ended_at - started_at))) AS sum_ride_length_seconds,
        COUNT(*) AS user_count
    FROM user_data
    GROUP BY member_casual
)
SELECT 
    user_type,
    CONCAT(
        TO_CHAR(FLOOR(sum_ride_length_seconds / 3600), 'FM999,999,999'), ' hours, ',
        FLOOR((sum_ride_length_seconds % 3600) / 60), ' minutes, ',
        FLOOR(sum_ride_length_seconds % 60), ' seconds'
    ) AS total_max_ride_length_for_the_year,
    CONCAT(
        TO_CHAR(FLOOR((sum_ride_length_seconds / 3600 / user_count) / 60), 'FM999,999,999'), ' hours, ',
        FLOOR((sum_ride_length_seconds / user_count % 3600) / 60), ' minutes, ',
        FLOOR((sum_ride_length_seconds / user_count) % 60), ' seconds'
    ) AS normalized_max_ride_length_for_the_year
FROM MaxRideLengths;
