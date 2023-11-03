select GroupName, SumMark
from Groups as gs
left join
(
    select GroupId, sum(SumMarkId) as SumMark from Students
    natural join
        (select StudentId, sum(Mark) as SumMarkId from Marks group by StudentId) SumPr
        group by GroupId
) SumTot
on SumTot.GroupId = gs.GroupId;