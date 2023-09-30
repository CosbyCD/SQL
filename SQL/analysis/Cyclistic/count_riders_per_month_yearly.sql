/*
File: count_riders_per_month_yearly.sql

Employing the crosstab function to transform ride
count data from the user_data table. Calculating and categorizing
the number of rides undertaken by both member and casual riders 
for each month of the year. The pivot table generated from this query
allows analysis of monthly ride patterns and a comparison of ride counts
between member and casual riders.
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

