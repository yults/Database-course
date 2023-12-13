insert into Sessions (Start, TeamId, ContestId)
select current_timestamp, TeamId, :ContestId
from Sessions
where ContestId = :ContestId;