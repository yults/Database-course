select distinct StudentId from Lecturers
natural join Plan natural join Marks natural join Students
where LecturerName = :LecturerName;