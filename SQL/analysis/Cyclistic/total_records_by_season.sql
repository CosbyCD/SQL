/*
File: "total_records_by_season.sql"

Seasonal ride counts.
*/

SELECT
  CASE
    WHEN EXTRACT(MONTH FROM started_at) IN (12, 1, 2) THEN 'Winter'
    WHEN EXTRACT(MONTH FROM started_at) IN (3, 4, 5) THEN 'Spring'
    WHEN EXTRACT(MONTH FROM started_at) IN (6, 7, 8) THEN 'Summer'
    WHEN EXTRACT(MONTH FROM started_at) IN (9, 10, 11) THEN 'Autumn'
  END AS season,
  TO_CHAR(COUNT(*), '999,999,999') AS total_records_by_season
FROM
  user_data
GROUP BY
  season
ORDER BY
  MIN(EXTRACT(MONTH FROM started_at));
