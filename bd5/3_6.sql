select StudentId, StudentName, GroupId
from Students
natural join (select CourseId from Plan natural join Lecturers where LecturerName = :LecturerName) CourseLecturerName
natural join Marks
where Mark = :Mark;