create view Debts as
select StudentId, count(distinct p.CourseId) as Debts
from Students s natural join Plan p 
where p.CourseId not in (
    select m.CourseId 
    from Marks m
    where s.StudentId = m.StudentId
)
group by StudentId
having count(distinct p.CourseId) > 0;