/*
File: create_temporal_data_backup.sql

Creating data backup to safeguard data integrity and provide a safety net for potential changes.
*/


CREATE TABLE temporal_data_backup AS
SELECT * FROM temporal_data;
