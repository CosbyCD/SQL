/*
File: count_riders_per_month_yearly.sql

Monthly counts per segmented groups.
*/


-- Enable the tablefunc extension if not already enabled
CREATE EXTENSION IF NOT EXISTS tablefunc;

-- Your actual query using the crosstab function
SELECT *
FROM crosstab(
    'SELECT
        EXTRACT(MONTH FROM started_at) AS month_number,
        member_casual,
        TO_CHAR(COUNT(*), ''9,999,999'') AS ride_count
    FROM
        user_data
    GROUP BY
        month_number, member_casual
    ORDER BY
        month_number',
    'VALUES (''member''), (''casual'')'
) AS pivot_table(month_number int, member text, casual text);

