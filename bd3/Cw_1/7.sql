select p.ContestId, p.Letter
from Problems p 
left join Sessions s1
on s1.ContestId = p.ContestId 
left join Sessions s2 
on s2.SessionId = s1.SessionId 
left join Runs r
on r.SessionId = s2.SessionId and r.ContestId = p.ContestId and r.Letter = p.Letter and r.Accepted = 1 where p.ContestId = :ContestId 
group by p.ContestId, p.Letter
having count(distinct s1.SessionId) = count(distinct s2.SessionId);