/*
File: temperature_decrease_ridership_analysis_query.sql

Analyzes ridership changes in response to temperature shift decreases. Compares current and previous rider counts in different temperature ranges.
*/

WITH TemperatureShifts AS (
    SELECT
        td.date_w AS shift_date,
        td.feelslike AS shift_temp,
        LAG(td.feelslike) OVER (ORDER BY td.date_w) AS prev_temp,
        LAG(td.date_w) OVER (ORDER BY td.date_w) AS prev_date
    FROM temporal_data td
),
RidershipCounts AS (
    SELECT
        ts.shift_date,
        ts.shift_temp AS shifted_temperature,
        ts.prev_temp AS previous_temperature,
        TO_CHAR(rc_shift.casual_riders_count, '9,999,999') AS current_casual_riders_count,
        TO_CHAR(rc_prev.casual_riders_count, '9,999,999') AS previous_casual_riders_count,
        TO_CHAR(rc_shift.member_riders_count, '9,999,999') AS current_member_riders_count,
        TO_CHAR(rc_prev.member_riders_count, '9,999,999') AS previous_member_rider_count
    FROM TemperatureShifts ts
    LEFT JOIN (
        SELECT date_start,
               COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casual_riders_count,
               COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS member_riders_count
        FROM user_data
        GROUP BY date_start
    ) rc_shift ON ts.shift_date = rc_shift.date_start
    LEFT JOIN (
        SELECT date_start,
               COUNT(CASE WHEN member_casual = 'casual' THEN 1 END) AS casual_riders_count,
               COUNT(CASE WHEN member_casual = 'member' THEN 1 END) AS member_riders_count
        FROM user_data
        GROUP BY date_start
    ) rc_prev ON ts.prev_date = rc_prev.date_start
    WHERE ts.prev_temp - ts.shift_temp > 10
)
SELECT
    rc.shift_date,
    rc.shifted_temperature,
    rc.previous_temperature,
    current_casual_riders_count,
    previous_casual_riders_count,
    current_member_riders_count,
    previous_member_rider_count
FROM RidershipCounts rc
ORDER BY rc.shifted_temperature DESC;
