insert into Marks (StudentId, CourseId, Mark)
select nms.StudentId, nms.CourseId, nms.Mark
from NewMarks nms left join Marks m
on nms.StudentId = m.StudentId
and nms.CourseId = m.CourseId
where m.Mark is null;