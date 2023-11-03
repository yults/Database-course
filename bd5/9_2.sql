select StudentName, AvgMark
from Students as ss
left join
(
    select StudentId, avg(cast(Mark as double)) as AvgMark from Marks group by StudentId
) SumId
on ss.StudentId = SumId.StudentId;

