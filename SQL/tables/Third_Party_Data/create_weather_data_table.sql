/*
File: create_weather_data_table.sql

Creates a table named 'weather_data' with various columns to store weather-related information
such as temperature, precipitation, wind speed, and other meteorological data.
*/

CREATE TABLE weather_data (
    name TEXT,
    datetime TIMESTAMP,
    tempmax NUMERIC,
    tempmin NUMERIC,
    temp NUMERIC,
    feelslikemax NUMERIC,
    feelslikemin NUMERIC,
    feelslike NUMERIC,
    dew NUMERIC,
    humidity NUMERIC,
    precip NUMERIC,
    precipprob NUMERIC,
    precipcover NUMERIC,
    preciptype TEXT,
    snow NUMERIC,
    snowdepth NUMERIC,
    windgust NUMERIC,
    windspeed NUMERIC,
    winddir NUMERIC,
    sealevelpressure NUMERIC,
    cloudcover NUMERIC,
    visibility NUMERIC,
    solarradiation NUMERIC,
    solarenergy NUMERIC,
    uvindex NUMERIC,
    severerisk NUMERIC,
    sunrise TIMESTAMP,
    sunset TIMESTAMP,
    moonphase NUMERIC,
    conditions TEXT,
    description TEXT,
    icon TEXT,
    stations TEXT
);
