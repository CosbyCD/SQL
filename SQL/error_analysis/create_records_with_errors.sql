/*
File: create_records_with_errors.sql

Identifies and isolates records with missing or incorrect values in various columns,
placing them in a new table named records_with_errors.
*/


CREATE TABLE records_with_errors AS
SELECT *
FROM user_data
WHERE
    ride_id IS NULL OR 
    ride_id = '' OR 
    TRIM(ride_id) = '' OR
    rideable_type IS NULL OR 
    rideable_type = '' OR 
    TRIM(rideable_type) = '' OR
    started_at IS NULL OR
    ended_at IS NULL OR
    start_station_name IS NULL OR 
    start_station_name = '' OR 
    TRIM(start_station_name) = '' OR
    start_station_id IS NULL OR 
    start_station_id = '' OR 
    TRIM(start_station_id) = '' OR
    end_station_name IS NULL OR 
    end_station_name = '' OR 
    TRIM(end_station_name) = '' OR
    end_station_id IS NULL OR 
    end_station_id = '' OR 
    TRIM(end_station_id) = '' OR
    start_lat IS NULL OR
    start_lng IS NULL OR
    end_lat IS NULL OR
    end_lng IS NULL OR
    member_casual IS NULL OR 
    member_casual = '' OR 
    TRIM(member_casual) = '' OR
    ride_length IS NULL OR
    day_of_week IS NULL OR
    name_of_day IS NULL	OR
    ride_length < 0 OR
    ride_length > 1440;
