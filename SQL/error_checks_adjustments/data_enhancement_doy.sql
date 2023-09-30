/*
File: data_enhancement_doy.sql

Adds a new column 'day_of_year' to the 'user_data' table, then updates it by extracting the 
day of the year from the 'started_at' column for each record in 'user_data'.
*/ 


ALTER TABLE user_data
ADD COLUMN day_of_year INTEGER;

-- Update the 'day_of_year' column for each record in 'user_data'
UPDATE user_data
SET day_of_year = DATE_PART('doy', started_at::date);

