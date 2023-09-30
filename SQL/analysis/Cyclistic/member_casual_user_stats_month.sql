/*
File: member_casual_user_stats_month.sql

A breakdown of segmented user counts, along with the percentage difference,
for each month of the year.
*/

WITH counts AS (
    SELECT
        EXTRACT(MONTH FROM started_at) AS month,
        COUNT(*) FILTER (WHERE member_casual = 'member') AS member_count,
        COUNT(*) FILTER (WHERE member_casual = 'casual') AS casual_count
    FROM
        user_data
    GROUP BY
        EXTRACT(MONTH FROM started_at)
)
SELECT
    TO_CHAR(TO_DATE(EXTRACT(YEAR FROM CURRENT_DATE) || '-' || month || '-01', 'YYYY-MM-DD'), 'Month') AS months,
    TO_CHAR(member_count, 'FM999,999,999') AS membership_count,
    TO_CHAR(casual_count, 'FM999,999,999') AS casual_use_count,
    ROUND(
        ((member_count - casual_count)::numeric / NULLIF(member_count, 0)) * 100,
        2
    ) AS percentage_difference
FROM
    counts
ORDER BY
    EXTRACT(MONTH FROM TO_DATE(month::text, 'MM'));
