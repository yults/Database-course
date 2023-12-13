update Runs as r
set Accepted = 0
where (r.SessionId, r.Letter, r.SubmitTime) in (
    select SessionId, Letter, MIN(SubmitTime) as SubmitTime
    from Runs
    group by SessionId, Letter
);