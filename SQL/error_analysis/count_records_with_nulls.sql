/*
File: "count_records_with_nulls.sql"

Provides statistics on data quality, including total records, total records with errors, and error percentage for the dataset.
*/

-- Calculate the Percentage of Records with NULLs

-- This SQL query calculates the error percentage in the "user_data" table by
-- determining the total number of records with errors and the overall total number
-- of records in the table. It achieves this by employing a Common Table Expression (CTE)
-- called "total_null_counts" to count records with NULL values in specific columns.

WITH total_null_counts AS (
    SELECT
        COUNT(*) AS total_records_with_errors
    FROM
        user_data
    WHERE
        ride_id IS NULL OR
        rideable_type IS NULL OR
        started_at IS NULL OR
        ended_at IS NULL OR
        start_station_name IS NULL OR
        start_station_id IS NULL OR
        end_station_name IS NULL OR
        end_station_id IS NULL OR
        start_lat IS NULL OR
        start_lng IS NULL OR
        end_lat IS NULL OR
        end_lng IS NULL OR
        member_casual IS NULL OR
        ride_length IS NULL OR
        day_of_week IS NULL OR
        name_of_day IS NULL
)
SELECT
    TO_CHAR(total_records, '999,999,999') AS total_records,
    TO_CHAR(total_records_with_errors, '999,999,999') AS total_records_with_errors,
    TO_CHAR((total_records_with_errors::float / total_records * 100), '999.99') AS error_percentage
FROM
    (SELECT COUNT(*) AS total_records FROM user_data) AS total_records,
    total_null_counts;
