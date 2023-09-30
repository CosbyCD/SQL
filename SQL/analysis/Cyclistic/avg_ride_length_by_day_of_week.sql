/*
File: avg_ride_length_by_day_of_week.sql

Average duration by segmented groups, by days of the week, presented in a crosstab pivot table format.
*/


SELECT *
FROM crosstab(
    'SELECT
        CASE WHEN member_casual = ''member'' THEN ''Member'' ELSE ''Casual'' END AS category,
        EXTRACT(DOW FROM started_at) AS day_of_week,
        ROUND(AVG(CAST(ride_length AS numeric)), 4) AS average_ride_length
    FROM
        user_data
    GROUP BY
        1, 2
    ORDER BY
        1, 2',
    'VALUES (0), (1), (2), (3), (4), (5), (6)'
) AS pivot_table(category text, "Sunday" numeric, "Monday" numeric, "Tuesday" numeric,
				 "Wednesday" numeric, "Thursday" numeric, "Friday" numeric, "Saturday" numeric);
