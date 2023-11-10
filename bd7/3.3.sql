update Students
set Marks = Marks + (
    select count(*) 
    from NewMarks nms
    where Students.StudentId = nms.StudentId
)
where true;