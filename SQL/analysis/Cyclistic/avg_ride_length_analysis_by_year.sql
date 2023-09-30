/*
File: avg_ride_length_analysis_by_year

Average ride duration by segmented groups in a one-year span, including rounded mean and percentage variances.
*/


SELECT
    year,
    ROUND(member_mean_ride_length_minutes, 2) AS rounded_member_mean_ride_length_minutes,
    ROUND(casual_mean_ride_length_minutes, 2) AS rounded_casual_mean_ride_length_minutes,
    ROUND(
        (
            (casual_mean_ride_length_minutes - member_mean_ride_length_minutes)
            / NULLIF(casual_mean_ride_length_minutes, 0)
        ) * 100,
        2
    ) AS percentage_difference
FROM (
    SELECT
        EXTRACT(YEAR FROM started_at) AS year,
        AVG(
            CASE WHEN member_casual = 'member'
                 THEN EXTRACT(EPOCH FROM (ended_at - started_at)) / 60 END
        )::numeric AS member_mean_ride_length_minutes,
        AVG(
            CASE WHEN member_casual = 'casual'
                 THEN EXTRACT(EPOCH FROM (ended_at - started_at)) / 60 END
        )::numeric AS casual_mean_ride_length_minutes
    FROM
        user_data
    GROUP BY
        year
) AS subquery;

