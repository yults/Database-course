select StudentId
from Students
where Students.GroupId in (
    select GroupId
    from Plan
    where Plan.LecturerId in (
        select LecturerId 
        from Lecturers
        where Lecturers.LecturerName = :LecturerName
    )
    and Plan.CourseId in (
        select Marks.CourseId 
        from Marks
        where Marks.StudentId = Students.StudentId
    )
);