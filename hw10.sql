--Мин. уровень изоляции - read committed (есть грязное чтение)
--Аномалии - есть или нет
--Косая запись: нет - только чтение данных, запись не производится
--Фантомная запись и неповторяемое чтение: нет - читаем один раз
-- из разных таблиц
--Грязное чтение: да - может быть если читаем незафиксированные 
--значения затем откатываем их
start transaction read only isolation level read committed;

--Мин. уровень изоляции - read committed (есть грязное чтение)
--Аномалии - есть или нет
--Косая запись: нет - не обновляет данные 
--Фантомная запись и неповторяемое чтение: нет - читаем один раз
-- из разных таблиц
--Грязное чтение: да - возможны rollback-и
start transaction read write isolation level read committed;


--Мин. уровень изоляции - read committed (есть грязное чтение)
--Аномалии - есть или нет
--Косая запись: нет - одновременно не обновляем разные записи
-- основанные на одних данных 
--Фантомная запись и неповтораяемое чтение: нет - читаем один раз
--из разных таблиц и делаем одну операцию обновления
--Грязное чтение: да - может быть если читаем незафиксированные 
--значения затем откатываем их
start transaction read write isolation level read committed;


--Мин. уровень изоляции - read repeatable (грязное неповт. чтение)
--Аномалии - есть или нет
--Косая запись: нет - одновременно не обновляем разные записи
-- основанные на одних данных 
--Фантомная запись: нет - читаем один раз
--Неповторяемое чтение: да - на момент начала место могло быть
-- свободно, в процессе заняться другими
--Грязное чтение: да - возможны rollback-и
start transaction read write isolation level repeatable read;


--Мин. уровень изоляции - read repeatable (грязное неповт. чтение)
--Аномалии - есть или нет
--Косая запись: нет - одновременно не обновляем разные записи
-- основанные на одних данных 
--Фантомная запись: нет - читаем один раз
--Неповторяемое чтение: да - бронь могла кончиться
--после начала транзации 
--Грязное чтение: да - возможны rollback-и
start transaction read write isolation level repeatable read;

--Мин. уровень изоляции - read committed (есть грязное чтение)
--Аномалии - есть или нет
--Косая запись: нет - только чтение данных, запись не производится
--Фантомная запись и неповторяемое чтение: нет - читаем один раз
-- из разных таблиц + статистике позволительно быть приблизительной
--Грязное чтение: да - читать незакомиченные изменения в статистике 
-- не нужно
start transaction read only isolation level read committed;

--Мин. уровень изоляции - read committed (есть грязное чтение)
--Аномалии - есть или нет
--Косая запись: нет - только чтение данных, запись не производится
--Фантомная запись и неповторяемое чтение: нет - читаем один раз
-- из разных таблиц + статистике позволительно быть приблизительной
--Грязное чтение: да - читать незакомиченные изменения в статистике 
-- не нужно
start transaction read only isolation level read committed;


--Мин. уровень изоляции - serializable (есть косая запись)
--Косая запись: множественное изменение записей
--при одновременной оптимищации и покупке/бронировании
start transaction read write isolation level serializable;

Сценарий: 
Чтобы просто узнать сколько мест не нужно ничего кроме FlightId.
Сервис получает от пользователя FlightId и идет в бд. 

start transaction read only isolation level read committed;
select SeatNo from FreeSeats(:FlightId);
commit;

Сценарий: 
Чтобы забронировать воспользуемся 

--бронирование
start transaction read write isolation level read committed;
select * from Reserve(:UserId, :Pass, :FlightId, :SeatNo);
commit;

--покупка -  место свободно
start transaction read write isolation level repeatable read;
select * from BuyFree(:FlightId, :SeatNo);
commit;

--покупка -  место забронировано
start transaction read write isolation level repeatable read;
select * from BuyReserved(:UserId, :Pass, :FlightId, :SeatNo);
commit;
