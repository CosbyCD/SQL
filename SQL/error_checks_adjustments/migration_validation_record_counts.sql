/*

File: "migration_validation_record_counts.sql"

Provides a count of total records in the 'user_data' table grouped by month, displayed with the month name. Ordered by chronological month.
*/


SELECT
  TO_CHAR(started_at, 'Month') AS month,
  COUNT(*) AS total_records_by_month
FROM
  user_data
GROUP BY
  TO_CHAR(started_at, 'Month'),
  date_part('month', started_at)
ORDER BY
  date_part('month', started_at);
