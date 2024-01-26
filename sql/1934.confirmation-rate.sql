-- Solution 1
with rate_table as (
    select
        user_id,
        ROUND(SUM(
            CASE
                WHEN action='confirmed' THEN 1 ELSE 0
            END
        ) / count(*), 2) AS confirmation_rate
    FROM Confirmations
    group by user_id
)

select s.user_id, IFNULL(r.confirmation_rate, 0) as confirmation_rate from Signups s join rate_table r on s.user_id = r.user_id

-- Solution 2
SELECT
    s.user_id,
    ROUND(SUM(IF(c.action='confirmed', 1, 0)) / count(*), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c on s.user_id = c.user_id
GROUP BY user_id;