select StudentId
from Students os
where os.StudentId not in (
    select vs.StudentId
    from Students vs, Plan
    where Plan.LecturerId in (
        select LecturerId 
        from Lecturers
        where Lecturers.LecturerName = :LecturerName
    )
    and Plan.CourseId not in (
        select Marks.CourseId 
        from Marks
        where vs.StudentId = Marks.StudentId
    )
    and Plan.GroupId = vs.GroupId
);