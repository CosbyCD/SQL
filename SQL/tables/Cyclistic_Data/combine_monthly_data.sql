/*
File: combine_monthly_data.sql

Combines separate tables into one cohesive dataset.
*/

CREATE TABLE user_data AS
SELECT * FROM cyclistic_data_1
UNION ALL SELECT * FROM cyclistic_data_2
UNION ALL SELECT * FROM cyclistic_data_3
UNION ALL SELECT * FROM cyclistic_data_4
UNION ALL SELECT * FROM cyclistic_data_5
UNION ALL SELECT * FROM cyclistic_data_6
UNION ALL SELECT * FROM cyclistic_data_7
UNION ALL SELECT * FROM cyclistic_data_8
UNION ALL SELECT * FROM cyclistic_data_9
UNION ALL SELECT * FROM cyclistic_data_10
UNION ALL SELECT * FROM cyclistic_data_11
UNION ALL SELECT * FROM cyclistic_data_12;
