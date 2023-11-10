delete from Students
where StudentId in (
    select StudentId
    from (
        select StudentId, CourseId
        from Students natural join Plan
        except 
        select StudentId, CourseId
        from Marks
    ) HasDolg
);
