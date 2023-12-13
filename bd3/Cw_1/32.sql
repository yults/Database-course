delete from Runs 
where SessionId in (
    select s.SessionId 
    from Contests natural join Sessions s
    where ContestName = :ContestName
);