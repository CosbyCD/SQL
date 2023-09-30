/*
File: "create_cyclistic_tables.sql"

Creates individual tables named cyclistic_data_1 to cyclistic_data_12 for importing data from 12 separate sources.
*/

DO $$ 
BEGIN
    FOR i IN 1..12 LOOP
        EXECUTE format('
            CREATE TABLE cyclistic_data_%s (
                ride_id text,
                rideable_type text,
                started_at timestamp,
                ended_at timestamp,
                start_station_name text,
                start_station_id text,
                end_station_name text,
                end_station_id text,
                start_lat decimal,
                start_lng decimal,
                end_lat decimal,
                end_lng decimal,
                member_casual text,
                ride_length text,
                day_of_week integer,
                name_of_day text
            );', i);
    END LOOP;
END $$;
