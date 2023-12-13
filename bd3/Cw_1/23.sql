select distinct TeamId from
Sessions, Runs
where Runs.SessionId = Sessions.SessionId and Accepted = 0 and ContestId = :ContestId;