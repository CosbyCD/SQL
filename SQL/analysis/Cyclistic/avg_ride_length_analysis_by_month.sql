/*
File: avg_ride_length_analysis_by_month.sql

Ride length data based on segmented groups,
broken down by month. It calculates average ride lengths,
along with the percentage difference between these averages. 
*/

SELECT
    TO_CHAR(started_at, 'Month') AS month,
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
    month
ORDER BY
    ROUND(AVG(CASE WHEN member_casual = 'casual'
                 THEN EXTRACT(EPOCH FROM (ended_at - started_at)) / 60 END)::numeric, 2) DESC;
