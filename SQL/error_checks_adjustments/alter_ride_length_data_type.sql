/*
File: alter_ride_length_data_type.sql
Description:

Changes the data type of the 'ride_length' column in the 'user_data' table to numeric.
*/

ALTER TABLE user_data
ALTER COLUMN ride_length SET DATA TYPE NUMERIC
USING ride_length::NUMERIC;
