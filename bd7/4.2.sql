update Marks
set Mark = (
    select nms.Mark 
    from NewMarks nms
    where Marks.StudentId = nms.StudentId and Marks.CourseId = nms.CourseId
)
where exists (
    select nms.Mark
    from NewMarks nms
    where Marks.StudentId = nms.StudentId and Marks.CourseId = nms.CourseId
);