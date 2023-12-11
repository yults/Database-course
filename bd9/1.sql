create or replace function NotFreeSeats(in FlightIdThis integer) 
    returns table
    ( 
        SeatNo varchar(4) 
    ) 
    language plpgsql
    security definer 
as
$$
begin 
    return query
        select Tickets.SeatNo
        from Tickets 
        where FlightId = FlightIdThis
         and Condition = 'reserved' and Ability > now() - interval '3 hours'
         or Condition = 'sold'
    union select SeatsGlobal.SeatNo
     from SeatsGlobal
      where FlightId = FlightIdThis and FlightTime < now() - interval '3 days';
end
$$;
create or replace function FreeSeats(in FlightIdThis integer)
    returns tableы
    ( 
        SeatNo varchar(4) 
    ) 
    language plpgsql
    security definer 
as
$$
declare Pid integer;
begin
    Pid := (select PlaneId
        from Flights
        where FlightId = FlightIdThis);
    return query 
        select ss.SeatNo 
        from Seats ss
        where PlaneId = Pid
            and ss.SeatNo not in (select NotFreeSeats.SeatNo
                                from NotFreeSeats(FlightIdThis));
end 
$$;


