/*
File: create_records_with_errors_backup.sql

Creating data backup to safeguard data integrity and provide a safety net for potential changes.
*/


CREATE TABLE records_with_errors_backup AS
SELECT * FROM records_with_errors;
