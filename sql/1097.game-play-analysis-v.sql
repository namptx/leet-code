with T as (select
               player_id,
               event_date,
               min(event_date) over (partition by player_id) as install_dt
           from 1097_activity)
select
    install_dt,
    count(distinct player_id) as installs,
    round(sum(datediff(event_date, install_dt) = 1) / count(distinct player_id), 2) as Day1_retention
from T
group by install_dt;

explain select
            player_id,
            event_date,
            min(event_date) over (partition by player_id) as install_dt
        from 1097_activity;

