/*
File: alter_align_temporal_granularity_between_datasets.sql

Adds a new column named 'date_start' to the 'user_data' table. Updates the 'date_start' column 
with the extracted date from the 'started_at' column.
*/

/* RUN THESE INDIVIDUALLY - ADD THE COLUMN FIRST, THEN UPDATE THE DATA */


-- Add the 'date_start' column to the 'user_data' table
ALTER TABLE user_data
ADD COLUMN date_start DATE;

-- Update the 'date_start' column with extracted date from 'started_at'
UPDATE user_data
SET date_start = DATE(started_at);
