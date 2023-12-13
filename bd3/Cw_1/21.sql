select distinct TeamId 
from Sessions natural join Runs
where Accepted = 0 and ContestId = :ContestId and Letter = :Letter;