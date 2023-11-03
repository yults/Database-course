select StudentName, CourseName
from (select distinct StudentId, CourseId from Students natural join Plan) StudentCourseId
natural join Courses natural join Students;
