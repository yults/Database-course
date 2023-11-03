select StudentName, SumMark
from Students as ss
left join
(
    select StudentId, sum(Mark) as SumMark from Marks group by StudentId
) SumId
on ss.StudentId = SumId.StudentId;