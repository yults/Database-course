create view StudentMarks as
select StudentId, count(Mark) as Marks
from Students natural left join Marks
group by StudentId;