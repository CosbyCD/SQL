/*
File: "identify_duplicate_rides.sql"

Identifies and counts duplicate records.
*/


SELECT ride_id, started_at, COUNT(*) AS duplicate_count
FROM user_data
GROUP BY ride_id, started_at
HAVING COUNT(*) > 1;
