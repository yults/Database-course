select RunId, TeamId, SubmitTime, Accepted
from Sessions natural join Runs
where Letter = :Letter and ContestId = :ContestId;