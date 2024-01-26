select A.player_id, A.event_date, sum(B.games_played) as games_played_so_far
from Activity as A
join Activity B on A.player_id = B.player_id and B.event_date <= A.event_date
group by A.player_id, A.event_date
