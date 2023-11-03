select StudentName, CourseName
from (
    select distinct StudentId, CourseId from Students natural join Plan
        except select StudentId, CourseId from Marks where Mark = 4 or Mark = 5
    ) BadStudents
natural join Students natural join Courses;