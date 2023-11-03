select StudentName, CourseName
from Courses natural join Students natural join 
(select distinct StudentId, CourseId from Students natural join Plan
except 
select distinct StudentId, CourseId from Marks) StudentCourseIdNot;