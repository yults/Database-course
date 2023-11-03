select StudentId, StudentName, GroupName
from Students, Groups
where Students.GroupId = Groups.GroupId
    and StudentId not in (
        select StudentId from Marks where CourseId = :CourseId
    )
;