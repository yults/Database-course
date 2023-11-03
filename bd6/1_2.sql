select StudentId, StudentName, Students.GroupId
from Students
where Students.GroupId in (
    select Groups.GroupId from Groups
    where Groups.GroupName = :GroupName 
);