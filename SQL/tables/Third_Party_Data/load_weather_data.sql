/*
File: load_weather_data.sql

Copies data from the specified CSV file into the 'weather_data' table.
*/


COPY weather_data 
FROM 'D:\GAC_Cyclistic_project\Weather\Chicago_Illinois_2022-01-01_to_2022-12-31.csv'
DELIMITER ',' CSV HEADER;
