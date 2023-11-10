update Students 
set Marks = (
    select count(CourseId) 
    from Marks m 
    where Students.StudentId = m.StudentId),
    Debts = (
        select count(distinct p.CourseId) 
        from Students s natural join Plan p
        where Students.StudentId = s.StudentId
        and p.CourseId not in (
            select m.CourseId
            from Marks m
            where m.StudentId = s.StudentId
        )
)
where true;