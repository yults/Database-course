select GroupName, CourseName
from Groups, Courses
where Groups.GroupId not in (
    select Students.GroupId
    from Students
    where Students.StudentId not in (
        select Marks.StudentId
        from Marks
        where Marks.CourseId = Courses.CourseId
    )
);