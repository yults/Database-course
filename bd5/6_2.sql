select StudentId from Students
except
select StudentId from Lecturers
natural join Plan natural join Marks natural join Students
where LecturerName = :LecturerName;