/*
File: mode_day_yearly.sql

Segments user ride data by the most frequent day of the week, providing the average ride length in minutes
for each day, categorized by user type over the course of a year.
*/

SELECT
    mfd.name_of_day,
    mfd.day_of_week,
    cd.user_type,
    ROUND(AVG(EXTRACT(EPOCH FROM (cd.ended_at - cd.started_at)) / 60)::numeric, 2) AS yearly_mean_ride_length_minutes
FROM (
    SELECT
        name_of_day,
        started_at,
        ended_at,
        CASE
            WHEN member_casual = 'member' THEN 'Member'
            WHEN member_casual = 'casual' THEN 'Casual'
        END AS user_type
    FROM
        user_data
) AS cd
JOIN (
    SELECT
        name_of_day,
        EXTRACT(DOW FROM started_at) AS day_of_week
    FROM
        user_data
    GROUP BY
        name_of_day, EXTRACT(DOW FROM started_at)
    ORDER BY
        COUNT(*) DESC
    LIMIT 1
) AS mfd ON EXTRACT(DOW FROM cd.started_at) = mfd.day_of_week
GROUP BY
    mfd.name_of_day, mfd.day_of_week, cd.user_type
ORDER BY
    mfd.day_of_week, cd.user_type;
