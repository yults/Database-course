create view StudentDebts as
select s.StudentId, (
    select count(distinct p.CourseId) from Plan p
    where s.GroupId = p.GroupId 
    and not exists (
    select m.CourseId 
    from Marks m
    where s.StudentId = m.StudentId
    and p.CourseId = m.CourseId
    )
) Debts
from Students s;