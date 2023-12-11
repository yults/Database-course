--PostgreSQL 15.4

create table Flights
(
    FlightId   integer   not null primary key, 
    FlightTime timestamp not null, 
    PlaneId    integer   not null,
    ReserveDisabled timestamp,
    SoldDisabled    timestamp
);

--Места в самолетах с номерами в формате: 123A
create table Seats
(
    PlaneId integer    not null,
    SeatNo  varchar(4) not null
);

--Клиенты и их пароли
create table Users
(
    UserId        integer not null primary key,
    UserPassword  text    not null --хеш
);

--Билет забронирован или продан
create type TickectCondition as enum ('reserved', 'sold');

--Забронированные и проданные билеты
create table Tickects 
(
    FlightId    integer          not null, 
    SeatNo      varchar(4)       not null, 
    UserId      integer          not null,
    Condition   TickectCondition not null,
    Ability timestamp,
    primary key (FlightId, SeatNo)
);

create view SeatsGlobal as 
select FlightId, FlightTime, PlaneId, SeatNo
from Flights natural join Seats;