/*
File: count_fields_with_nulls.sql

Provides a summary of data quality, including total fields, total nulls, and error percentage for the dataset.
*/

SELECT
    TO_CHAR(COUNT(*) * 17, '999,999,999') AS total_fields,
    TO_CHAR(SUM(
        CASE WHEN ride_id IS NULL OR ride_id = '' OR ride_id = ' ' THEN 1 ELSE 0 END +
        CASE WHEN rideable_type IS NULL OR rideable_type = '' OR rideable_type = ' ' THEN 1 ELSE 0 END +
        CASE WHEN started_at IS NULL THEN 1 ELSE 0 END +
        CASE WHEN ended_at IS NULL THEN 1 ELSE 0 END +
        CASE WHEN start_station_name IS NULL OR start_station_name = '' OR start_station_name = ' ' THEN 1 ELSE 0 END +
        CASE WHEN start_station_id IS NULL OR start_station_id = '' OR start_station_id = ' ' THEN 1 ELSE 0 END +
        CASE WHEN end_station_name IS NULL OR end_station_name = '' OR end_station_name = ' ' THEN 1 ELSE 0 END +
        CASE WHEN end_station_id IS NULL OR end_station_id = '' OR end_station_id = ' ' THEN 1 ELSE 0 END +
        CASE WHEN start_lat IS NULL THEN 1 ELSE 0 END +
        CASE WHEN start_lng IS NULL THEN 1 ELSE 0 END +
        CASE WHEN end_lat IS NULL THEN 1 ELSE 0 END +
        CASE WHEN end_lng IS NULL THEN 1 ELSE 0 END +
        CASE WHEN member_casual IS NULL OR member_casual = '' OR member_casual = ' ' THEN 1 ELSE 0 END +
        CASE WHEN ride_length IS NULL THEN 1 ELSE 0 END +
        CASE WHEN day_of_week IS NULL THEN 1 ELSE 0 END +
        CASE WHEN name_of_day IS NULL THEN 1 ELSE 0 END
    ), '999,999,999') AS total_nulls,
    TO_CHAR((SUM(
        CASE WHEN ride_id IS NULL OR ride_id = '' OR ride_id = ' ' THEN 1 ELSE 0 END +
        CASE WHEN rideable_type IS NULL OR rideable_type = '' OR rideable_type = ' ' THEN 1 ELSE 0 END +
        CASE WHEN started_at IS NULL THEN 1 ELSE 0 END +
        CASE WHEN ended_at IS NULL THEN 1 ELSE 0 END +
        CASE WHEN start_station_name IS NULL OR start_station_name = '' OR start_station_name = ' ' THEN 1 ELSE 0 END +
        CASE WHEN start_station_id IS NULL OR start_station_id = '' OR start_station_id = ' ' THEN 1 ELSE 0 END +
        CASE WHEN end_station_name IS NULL OR end_station_name = '' OR end_station_name = ' ' THEN 1 ELSE 0 END +
        CASE WHEN end_station_id IS NULL OR end_station_id = '' OR end_station_id = ' ' THEN 1 ELSE 0 END +
        CASE WHEN start_lat IS NULL THEN 1 ELSE 0 END +
        CASE WHEN start_lng IS NULL THEN 1 ELSE 0 END +
        CASE WHEN end_lat IS NULL THEN 1 ELSE 0 END +
        CASE WHEN end_lng IS NULL THEN 1 ELSE 0 END +
        CASE WHEN member_casual IS NULL OR member_casual = '' OR member_casual = ' ' THEN 1 ELSE 0 END +
        CASE WHEN ride_length IS NULL THEN 1 ELSE 0 END +
        CASE WHEN day_of_week IS NULL THEN 1 ELSE 0 END +
        CASE WHEN name_of_day IS NULL THEN 1 ELSE 0 END
    )::float / (COUNT(*) * 17) * 100), '999.99') AS error_percentage
FROM
    user_data;
