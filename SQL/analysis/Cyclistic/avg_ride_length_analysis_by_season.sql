/*
File: avg_ride_length_analysis_by_season.sql

Average durations, segmented by group and seasonality, with percentage differences.
*/

SELECT
    CASE
        WHEN EXTRACT(MONTH FROM started_at) BETWEEN 3 AND 5 THEN 'Spring'
        WHEN EXTRACT(MONTH FROM started_at) BETWEEN 6 AND 8 THEN 'Summer'
        WHEN EXTRACT(MONTH FROM started_at) BETWEEN 9 AND 11 THEN 'Autumn'
        ELSE 'Winter'
    END AS season,
    ROUND(
        AVG(CASE WHEN member_casual = 'member'
                 THEN EXTRACT(EPOCH FROM (ended_at - started_at)) / 60 END)::numeric, 2
    ) AS member_mean_ride_length_minutes,
    ROUND(
        AVG(CASE WHEN member_casual = 'casual'
                 THEN EXTRACT(EPOCH FROM (ended_at - started_at)) / 60 END)::numeric, 2
    ) AS casual_mean_ride_length_minutes,
    ROUND(
        (
            (
                AVG(CASE WHEN member_casual = 'casual'
                         THEN EXTRACT(EPOCH FROM (ended_at - started_at)) / 60 END)::numeric
            ) - (
                AVG(CASE WHEN member_casual = 'member'
                         THEN EXTRACT(EPOCH FROM (ended_at - started_at)) / 60 END)::numeric
            )
        ) / AVG(CASE WHEN member_casual = 'casual'
                   THEN EXTRACT(EPOCH FROM (ended_at - started_at)) / 60 END)::numeric * 100, 2
    ) AS percentage_difference
FROM
    user_data
GROUP BY
    CASE
        WHEN EXTRACT(MONTH FROM started_at) BETWEEN 3 AND 5 THEN 'Spring'
        WHEN EXTRACT(MONTH FROM started_at) BETWEEN 6 AND 8 THEN 'Summer'
        WHEN EXTRACT(MONTH FROM started_at) BETWEEN 9 AND 11 THEN 'Autumn'
        ELSE 'Winter'
    END
ORDER BY
    casual_mean_ride_length_minutes DESC;
