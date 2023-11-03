select GroupName, AvgMark
from Groups as gs
left join
(
    select GroupId, avg(cast(Mark as double)) as AvgMark from Students
    natural join Marks group by GroupId
) AvgTot
on AvgTot.GroupId = gs.GroupId;