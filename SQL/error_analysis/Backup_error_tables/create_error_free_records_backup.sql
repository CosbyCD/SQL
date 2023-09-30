/*
File: create_error_free_records_backup.sql

Creating data backup to safeguard data integrity and provide a safety net for potential changes.
*/


CREATE TABLE error_free_records_backup AS
SELECT * FROM error_free_records;
