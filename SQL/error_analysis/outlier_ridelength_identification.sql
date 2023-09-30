/*
FILE: outlier_ridelength_identification.sql

Calculates the total count of records with negative ride durations, and removes records with negative ride durations.

Calculates the total count of records with ride durations exceeding a day, and removes records with ride durations exceeding a day.
*/

-- How many records with negative ride_length?
SELECT COUNT(*) AS total_records_with_negative_ride_length
FROM user_data
WHERE ride_length < 0;

-- View the records
SELECT ride_length AS negative_ride_length, COUNT(ride_length) AS total
FROM user_data
GROUP BY ride_length
HAVING ride_length < 0;

-- remove the records
DELETE FROM user_data
WHERE ride_length < 0;



-- How many records with ridelengths over a day
SELECT ride_length AS over_a_day_ride_length, COUNT(ride_length) AS total
FROM user_data
WHERE ride_length > 24
GROUP BY ride_length;

--view the records
SELECT *
FROM user_data
WHERE ride_length > 24

-- remove the records
DELETE FROM user_data
WHERE ride_length > 24;


