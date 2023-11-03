select StudentId, StudentName, GroupId
from Students
where Students.StudentId in (
    select Marks.StudentId from Marks
    where Marks.Mark = :Mark 
    and Marks.CourseId in (
        select Courses.CourseId from Courses 
        where Courses.CourseName = :CourseName
    )
);