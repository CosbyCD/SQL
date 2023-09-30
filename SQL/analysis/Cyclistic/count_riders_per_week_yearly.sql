/*
File: count_riders_per_week_yearly.sql

Weekly counts by segmented groups.
*/


SELECT *
FROM crosstab(
    'SELECT
        EXTRACT(WEEK FROM started_at) AS week_number,
        member_casual,
        TO_CHAR(COUNT(*), ''9,999,999'') AS ride_count
    FROM
        user_data
    GROUP BY
        week_number, member_casual
    ORDER BY
        week_number',
    'VALUES (''member''), (''casual'')'
) AS pivot_table(week_number int, member text, casual text);
