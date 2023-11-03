select StudentId
from Students
where Students.StudentId not in (
    select Marks.StudentId
    from Marks
    where Marks.CourseId in (
        select Plan.CourseId 
        from Plan 
        where Plan.LecturerId in (
            select LecturerId 
            from Lecturers
            where Lecturers.LecturerName = :LecturerName
        )
        and Plan.GroupId = Students.GroupId
    )
);