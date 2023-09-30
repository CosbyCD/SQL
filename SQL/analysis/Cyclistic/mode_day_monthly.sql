/*
File: mode_day_monthly.sql

Segments user ride data by day, presenting most frequent day, total rides, and average duration per month.
*/


WITH DayOfWeekCounts AS (
    SELECT
        TO_CHAR(started_at, 'Month') AS month,
        CASE 
            WHEN member_casual = 'member' THEN 'Member'
            WHEN member_casual = 'casual' THEN 'Casual'
        END AS user_type,
        EXTRACT(DOW FROM started_at) AS day_of_week,
        COUNT(*) AS ride_count,
        ROUND(AVG(EXTRACT(EPOCH FROM (ended_at - started_at)) / 60)::numeric, 2) AS avg_ride_length_minutes
    FROM user_data
    GROUP BY month, user_type, EXTRACT(DOW FROM started_at)
),
RankedDays AS (
    SELECT
        month,
        user_type,
        day_of_week,
        ride_count,
        avg_ride_length_minutes,
        ROW_NUMBER() OVER (PARTITION BY month, user_type ORDER BY ride_count DESC) AS rank
    FROM DayOfWeekCounts
)
SELECT
    month,
    user_type,
    CASE
        WHEN day_of_week = 0 THEN 'Sunday'
        WHEN day_of_week = 1 THEN 'Monday'
        WHEN day_of_week = 2 THEN 'Tuesday'
        WHEN day_of_week = 3 THEN 'Wednesday'
        WHEN day_of_week = 4 THEN 'Thursday'
        WHEN day_of_week = 5 THEN 'Friday'
        WHEN day_of_week = 6 THEN 'Saturday'
    END AS mode_day_of_week,
    MAX(ride_count) AS max_count,
    avg_ride_length_minutes
FROM RankedDays
WHERE rank = 1
GROUP BY month, user_type, day_of_week, avg_ride_length_minutes
ORDER BY 
    to_timestamp(month, 'Month')::DATE,
    user_type;
