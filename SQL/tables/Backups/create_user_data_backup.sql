/*
File: create_user_data_backup.sql

Creating data backup to safeguard data integrity and provide a safety net for potential changes.
*/


CREATE TABLE user_data_backup AS
SELECT * FROM user_data;
