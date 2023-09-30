/*
File: max_ride_length_analysis_seasonal.sql

Calculating total and maximum ride durations for segmented groups, adjusted and normalized
by user count on a seasonal basis over the course of a year.

*/

WITH MaxRideLengths AS (
    SELECT 
        CASE 
            WHEN member_casual = 'member' THEN 'Member'
            WHEN member_casual = 'casual' THEN 'Casual'
        END AS user_type,
        CASE
            WHEN EXTRACT(MONTH FROM started_at) BETWEEN 3 AND 5 THEN 'Spring'
            WHEN EXTRACT(MONTH FROM started_at) BETWEEN 6 AND 8 THEN 'Summer'
            WHEN EXTRACT(MONTH FROM started_at) BETWEEN 9 AND 11 THEN 'Autumn'
            ELSE 'Winter'
        END AS season,
        SUM(EXTRACT(EPOCH FROM (ended_at - started_at))) AS sum_ride_length_seconds,
        COUNT(*) AS user_count
    FROM user_data
    GROUP BY user_type, season
)
SELECT 
    season,
    user_type,
    CONCAT(
        TO_CHAR(FLOOR(sum_ride_length_seconds / 3600), 'FM999,999,999'), ' hours, ',
        TO_CHAR(FLOOR((sum_ride_length_seconds % 3600) / 60), 'FM999,999,999'), ' minutes, ',
        TO_CHAR(FLOOR(sum_ride_length_seconds % 60), 'FM999,999,999'), ' seconds'
    ) AS total_max_ride_length_for_the_season,
    CONCAT(
        TO_CHAR(FLOOR((sum_ride_length_seconds / 3600 / user_count) / 60), 'FM999,999,999'), ' hours, ',
        TO_CHAR(FLOOR((sum_ride_length_seconds / user_count % 3600) / 60), 'FM999,999,999'), ' minutes, ',
        TO_CHAR(FLOOR((sum_ride_length_seconds / user_count) % 60), 'FM999,999,999'), ' seconds'
    ) AS normalized_max_ride_length_for_the_season
FROM MaxRideLengths
ORDER BY
    CASE 
        WHEN season = 'Spring' THEN 1
        WHEN season = 'Summer' THEN 2
        WHEN season = 'Autumn' THEN 3
        ELSE 4
    END,
    user_type;
