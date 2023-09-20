/*

File: user_count_by_type.sql

This query provides the total number of each rider type
*/


SELECT member_casual, Count(*) AS user_count 
FROM user_data 
GROUP BY member_casual;