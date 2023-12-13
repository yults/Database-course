select TeamId, count(distinct Letter) AS Opened
from (
    select distinct s.TeamId, s.ContestId, r.Letter
    from Runs r
    natural join Sessions s
) as runs
group by TeamId;