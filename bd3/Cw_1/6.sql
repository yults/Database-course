select ProblemName
from Problems natural join (select Letter
from Problems
except
select Letter from Runs) TriedProblems;