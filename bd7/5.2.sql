create view AllMarks as
select StudentId, count(Mark) as Marks
from Students natural left join (
    select StudentId, CourseId, Mark
    from Marks 
    union all
    select StudentId, CourseId, Mark
    from NewMarks
) tAll
group by StudentId;