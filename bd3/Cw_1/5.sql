
select ProblemName
from
(select ContestId, Letter, ProblemName
from Problems
except
select ContestId, Letter, ProblemName
from Problems natural join Runs
where Accepted = 1) NeverSolved;
