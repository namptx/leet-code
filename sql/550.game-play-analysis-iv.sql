# Write your MySQL query statement below
select
    round(
            count(DISTINCT player_id) / (select count(DISTINCT player_id) from Activity),
            2) as fraction
from Activity
where (player_id, date_sub(event_date, interval 1 day)) in (
    select player_id, min(event_date) as event_date from Activity GROUP BY player_id
);

SELECT round(sum(login)/COUNT(DISTINCT player_id), 2) AS fraction
FROM (
  SELECT
    player_id,
    DATEDIFF(event_date, MIN(event_date) OVER(PARTITION BY player_id)) = 1 AS login
  FROM Activity
) AS t;
