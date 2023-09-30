/*

File: user_count_by_type.sql

Counts users by segmented groups.
*/


SELECT member_casual, Count(*) AS user_count 
FROM user_data 
GROUP BY member_casual;
