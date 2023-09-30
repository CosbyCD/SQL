/*
File merge_holidays_weather.sql

Creates a new table named 'temporal_data' containing all columns from both the 'holidays' and 'weather_data' tables.
*/


-- Create a new table to store the query results
CREATE TABLE temporal_data AS
SELECT *
FROM holidays
FULL OUTER JOIN (
    SELECT *,
           CAST(datetime AS DATE) AS date_w
    FROM weather_data
) AS weather_date_only
ON holidays.holiday_start_date = weather_date_only.date_w;
