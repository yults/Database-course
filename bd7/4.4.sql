merge into Marks m
using NewMarks nms on
nms.StudentId = m.StudentId and nms.CourseId = m.CourseId
when matched and nms.Mark > m.Mark then
    update 
    set m.Mark = nms.Mark
when not matched then 
    insert (StudentId, CourseId, Mark) values
    (nms.StudentId, nms.CourseId, nms.Mark);