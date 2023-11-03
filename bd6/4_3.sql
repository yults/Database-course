select StudentName, CourseName 
from (
    select distinct StudentId, StudentName, CourseId
    from Plan, Students
    where Plan.GroupId = Students.GroupId
    and not exists (
        select StudentId, CourseId
        from Marks
        where Marks.CourseId = Plan.CourseId
        and Students.StudentId = Marks.StudentId
        and Marks.Mark > 2
    ) 
) StudName, Courses where Courses.CourseId = StudName.CourseId; 
