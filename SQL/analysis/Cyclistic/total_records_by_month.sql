/*
File: total_records_by_month

Counts monthly rides in the dataset.
*/
SELECT
  EXTRACT(MONTH FROM started_at) AS month,
  TO_CHAR(COUNT(*), '999,999,999') AS total_records_by_month
FROM
  user_data
GROUP BY
  EXTRACT(MONTH FROM started_at)
ORDER BY
  EXTRACT(MONTH FROM started_at);
