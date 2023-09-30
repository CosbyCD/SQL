/*
File: "total_records_by_quarter.sql"

Quarterly ride counts.
*/

SELECT
  TO_CHAR(EXTRACT(QUARTER FROM started_at), '9') AS quarter,
  TO_CHAR(COUNT(*), '9,999,999') AS total_records_by_quarter
FROM
  user_data
GROUP BY
  EXTRACT(QUARTER FROM started_at)
ORDER BY
  EXTRACT(QUARTER FROM started_at);
