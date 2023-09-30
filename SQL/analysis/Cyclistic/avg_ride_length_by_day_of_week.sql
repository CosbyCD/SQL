/*
File: avg_ride_length_by_day_of_week.sql

Determining the average ride length for different 
user categories (i.e., "Member" and "Casual") across different 
days of the week. The query employs a crosstab approach to 
present the results in a structured pivot table format.

By categorizing ride data into "Member" and "Casual" categories,
it extracts the day of the week from the timestamp of each ride.
Then calculates the average ride length for each combination of
user category and day of the week, rounding the results to four
decimal places.

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
