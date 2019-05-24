SELECT * FROM Climb.Clumber;
use Climb;
insert into Clumber(name, adress)
values ('Tom Soer', 'СПБ, ул Ленина, д8, кв56');

insert into Clumber(name, adress)
values ('Geck', 'СПБ, ул Карла Маркса, д6, кв6');
insert into Clumber(name, adress)
values ('Mark', 'Москва, ул Ленина, д4, кв4');
insert into Clumber(name, adress)
values ('Bill', 'Москва, ул Карла Маркса, д1, кв1');

insert into route (nameMount, country, district, heightMount)values
('Монте-Роза', 'Швейцария','Вале', '4092'),
('Пик Бэйкер', 'США','Вашингтон', '3285'),
('Гора Килиманджаро', 'Африка','Танзания', '3285'),
('Гора Белуха', 'Россия','Алтай', '4509');

insert into Climbing (endClimb, startClimb, `Group`, IDClumber, route_idroute) values
('2017-08-04','2017-09-04','first', 1, 1),
('2018-10-04','2018-11-04','third', 2, 2),
('2018-06-04','2018-07-04','second', 2, 4),
('2019-05-04','2019-03-04','fifth', 1, 3);

select name from Clumber
where idClumber in
(select c.startClimb, r.nameMount, c.`Group`, c.iDClumber from route r
join Climbing c
ON c.route_idroute = r.idroute order by c.startClimb);

select c.startClimb, r.nameMount, c.`Group`, c.iDClumber as idClumber from route r
join Climbing c
ON c.route_idroute = r.idroute order by c.startClimb;

select name from Clumber;

insert into route (nameMount, country, district, heightMount)values
('Монте-Негро', 'Черногория','Будва', '3500');

select * from route; 

insert into Climbing (endClimb, startClimb, `Group`, IDClumber, route_idroute) values
('2020-08-04','2020-09-04','ten', 1, 1);
select * from Climbing; 
update Climbing SET endClimb='2020-10-05' where idClimb=5;

CREATE view clumber_view as select c.startClimb, r.nameMount, c.`Group`, c.iDClumber as idClumber from route r
join Climbing c
ON c.route_idroute = r.idroute order by c.startClimb;

select cl.name, v.idClumber, v.startClimb from Clumber cl
join clumber_view v
ON v.idClumber=cl.idClumber where v.startClimb <= '2018-07-04';

insert into Climbing (endClimb, startClimb, `Group`, IDClumber, route_idroute) values
('2015-08-04','2015-09-04','first', 3, 3),
('2016-10-04','2016-11-04','third', 4, 5),
('2013-06-04','2013-07-04','second', 3, 4),
('2014-05-04','2014-03-04','fifth', 4, 5);

select count(distinct idClumber) from clumber_view;

select `Group`, startClimb from clumber_view
where startClimb > '2018-07-04' and startClimb < '2019-07-04';

INSERT INTO Climbing(endClimb, startClimb, `Group`, IDClumber, route_idroute)
values('2019-01-04', '2019-01-04','вторая группа', 4, 2);

select nameMount, count(nameMount) from clumber_view
group by nameMount;


select cl.name, count(v.idClumber) as кол_восхождений
from Clumber cl, clumber_view v
where cl.idClumber=v.idClumber
group by v.idClumber;

DELIMITER $$
CREATE TRIGGER `route_id`
BEFORE DELETE ON `Climbing`
FOR EACH ROW
	BEGIN
	delete from `route` where idroute = OLD.route_idroute;
	delete from `Clumber` where idClumber = OLD.IDClumber;
	END$$
DELIMITER ;
drop trigger route_id;

delete from Climbing where idClimb = 2;