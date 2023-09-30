/*
File: create_error_free_records.sql

Creates a new table named error_free_records containing records that pass data quality checks. 
Records with missing or invalid values in certain columns are excluded.
*/

CREATE TABLE error_free_records AS
SELECT *
FROM user_data
WHERE NOT (
    (ride_id IS NULL OR ride_id = '' OR TRIM(ride_id) = '') OR
    (rideable_type IS NULL OR rideable_type = '' OR TRIM(rideable_type) = '') OR
    (started_at IS NULL) OR
    (ended_at IS NULL) OR
    (start_station_name IS NULL OR start_station_name = '' OR TRIM(start_station_name) = '') OR
    (start_station_id IS NULL OR start_station_id = '' OR TRIM(start_station_id) = '') OR
    (end_station_name IS NULL OR end_station_name = '' OR TRIM(end_station_name) = '') OR
    (end_station_id IS NULL OR end_station_id = '' OR TRIM(end_station_id) = '') OR
    (start_lat IS NULL) OR
    (start_lng IS NULL) OR
    (end_lat IS NULL) OR
    (end_lng IS NULL) OR
    (member_casual IS NULL OR member_casual = '' OR TRIM(member_casual) = '') OR
    (ride_length IS NULL) OR
    (day_of_week IS NULL) OR
    (name_of_day IS NULL) OR
    (ride_length < 0) OR
    (ride_length > 1440)
);
