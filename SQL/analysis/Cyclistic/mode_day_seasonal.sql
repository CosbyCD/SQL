/*
File: mode_day_seasonal.sql

Segments user ride data seasonally, providing most frequent day, total rides, and average duration per month.
*/


WITH seasonal_mode AS (
SELECT
        CASE
            WHEN EXTRACT(MONTH FROM started_at) BETWEEN 3 AND 5 THEN 'Spring'
            WHEN EXTRACT(MONTH FROM started_at) BETWEEN 6 AND 8 THEN 'Summer'
            WHEN EXTRACT(MONTH FROM started_at) BETWEEN 9 AND 11 THEN 'Autumn'
            ELSE 'Winter'
        END AS season,
        name_of_day,
        CASE 
            WHEN member_casual = 'member' THEN 'Member'
            WHEN member_casual = 'casual' THEN 'Casual'
        END AS user_type,
        ROUND(AVG(EXTRACT(EPOCH FROM (ended_at - started_at)) / 60)::numeric, 2)
		AS seasonal_mean_ride_length_minutes,
        RANK() OVER (PARTITION BY CASE
                                    WHEN EXTRACT(MONTH FROM started_at) BETWEEN 3 AND 5 THEN 'Spring'
                                    WHEN EXTRACT(MONTH FROM started_at) BETWEEN 6 AND 8 THEN 'Summer'
                                    WHEN EXTRACT(MONTH FROM started_at) BETWEEN 9 AND 11 THEN 'Autumn'
                                    ELSE 'Winter'
                                END, 
                                CASE 
                                    WHEN member_casual = 'member' THEN 'Member'
                                    WHEN member_casual = 'casual' THEN 'Casual'
                                END
                     ORDER BY COUNT(*) DESC) AS rank
    FROM
        user_data
    GROUP BY
        season, name_of_day, user_type
)
SELECT
    season,
    name_of_day,
    user_type,
    seasonal_mean_ride_length_minutes
FROM
    seasonal_mode
WHERE
    rank = 1
ORDER BY
    CASE
        WHEN season = 'Spring' THEN 1
        WHEN season = 'Summer' THEN 2
        WHEN season = 'Autumn' THEN 3
        WHEN season = 'Winter' THEN 4
    END,
    user_type;
