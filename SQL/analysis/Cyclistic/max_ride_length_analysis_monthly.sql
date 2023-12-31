/*
File: max_ride_length_analysis_monthly.sql

Calculating total and maximum ride durations for segmented groups, adjusted and normalized
by user count on a monthly basis over the course of a year.
*/

WITH MaxRideLengths AS (
    SELECT 
        TO_CHAR(started_at, 'Month') AS month,
        CASE 
            WHEN member_casual = 'member' THEN 'Member'
            WHEN member_casual = 'casual' THEN 'Casual'
        END AS user_type,
        SUM(EXTRACT(EPOCH FROM (ended_at - started_at))) AS sum_ride_length_seconds,
        COUNT(*) AS user_count
    FROM user_data
    GROUP BY month, member_casual
)
SELECT 
    month,
    user_type,
    CONCAT(
        TO_CHAR(FLOOR(sum_ride_length_seconds / 3600), 'FM999,999,999'), ' hours, ',
        TO_CHAR(FLOOR((sum_ride_length_seconds % 3600) / 60), 'FM999,999,999'), ' minutes, ',
        TO_CHAR(FLOOR(sum_ride_length_seconds % 60), 'FM999,999,999'), ' seconds'
    ) AS total_max_ride_length_for_the_month,
    CONCAT(
        TO_CHAR(FLOOR((sum_ride_length_seconds / 3600 / user_count) / 60), 'FM999,999,999'), ' hours, ',
        TO_CHAR(FLOOR((sum_ride_length_seconds / user_count % 3600) / 60), 'FM999,999,999'), ' minutes, ',
        TO_CHAR(FLOOR((sum_ride_length_seconds / user_count) % 60), 'FM999,999,999'), ' seconds'
    ) AS normalized_max_ride_length_for_the_month
FROM MaxRideLengths
ORDER BY 
    to_timestamp(month, 'Month')::DATE,
    user_type;
