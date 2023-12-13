update Runs
set Accepted = 1
where (SessionId, SubmitTime) in (
    select SessionId, MAX(SubmitTime) as SubmitTime
    from Runs
    where Accepted = 0
    group by SessionId
);