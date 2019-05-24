
insert into Clumber(name, adress)
values ('Tom Soer', 'СПБ, ул Ленина, д8, кв56');
insert into Clumber(name, adress)
values ('Geck', 'СПБ, ул Карла Маркса, д6, кв6');

insert into Clumber(name, adress)
values ('Mark', 'Москва, ул Ленина, д8, кв56');
insert into Clumber(name, adress)
values ('Bill', 'Москва, ул Карла Маркса, д6, кв6');

insert into(nameMount, country, district, heightMount)values
('Монте-Роза', 'Швейцария','Вале', '4092'),
('Пик Бэйкер', 'США','Вашингтон', '3285')
('Гора Килиманджаро', 'Африка','Танзания', '3285')
('Гора Белуха', 'Россия','Алтай', '4509');
insert into(nameMount, country, district, heightMount)values
('Монте-Роза', 'Швейцария','Вале', '4092'),
('Пик Бэйкер', 'США','Вашингтон', '3285'),
('Гора Килиманджаро', 'Африка','Танзания', '3285'),
('Гора Белуха', 'Россия','Алтай', '4509');

insert into(endClimb, startClimb, `Group`, IDClumber, route_idroute) values
('2017-08-04','2017-09-04','first', 1, 1),
('2018-10-04','2018-11-04','third', 2, 2),
('2018-06-04','2018-07-04','second', 2, 4),
('2019-05-04','2019-03-04','fifth', 1, 3);



База данных хроники восхождений в альпинистском клубе.
В базе данных должны записываться даты начала и завершения каждого восхождения, имена и адреса
участвовавших в нем альпинистов, название и высота горы, страна и район, где эта гора расположена. Дайте выразительные имена таблицам и полям, в которые могла бы заноситься указанная
информация. 
Написать пакет, состоящий из процедур и функций (либо отдельные запросы) которые позволили бы выполнить следующие действия с базой данных:

для каждой горы показать список групп, осуществлявших восхождение, в хронологическом порядке;
select c.startClimb, r.nameMount, c.`Group`, c.iDClumber as idClumber from route r
join Climbing c
ON c.route_idroute = r.idroute order by c.startClimb;

предоставить возможность добавления новой вершины, с указанием названия вершины, высоты и страны местоположения;
insert into(nameMount, country, district, heightMount)values
('Монте-Негро', 'Черногория','Будва', '3500');

 предоставить возможность изменения данных о вершине, если на нее не было восхождения;

insert into Climbing (endClimb, startClimb, `Group`, IDClumber, route_idroute) values
('2020-08-04','2020-09-04','ten', 1, 1);
UPDATE Climbing SET endClimb='2020-10-05' where idClimb=5;

 показать список альпинистов, осуществлявших восхождение в указанный интервал дат;
CREATE view clumber_view as select c.startClimb, r.nameMount, c.`Group`, c.iDClumber as idClumber from route r
join Climbing c
ON c.route_idroute = r.idroute order by c.startClimb;

select cl.name, v.idClumber, v.startClimb from Clumber cl
join clumber_view v
ON v.idClumber=cl.idClumber where v.startClimb >= '2018-07-04';

предоставить возможность добавления нового альпиниста в состав указанной группы;

 показать информацию о количестве восхождений каждого альпиниста на каждую гору;
select cl.name, count(v.idClumber) as кол_восхождений
from Clumber cl, clumber_view v
where cl.idClumber=v.idClumber
group by v.idClumber;

 показать список восхождений (групп), которые осуществлялись в указанный пользователем период времени;
select `Group`, startClimb from clumber_view where startClimb > '2018-07-04' and startClimb < '2019-07-04';

 предоставить возможность добавления новой группы, указав ее название, вершину, время начала восхождения;
INSERT INTO Climbing(endClimb, startClimb, `Group`, IDClumber, route_idroute)
values('2019-07-04', '2019-06-04','новая группа', 4, 2);

предоставить информацию о том, сколько альпинистов побывали на каждой горе.
select nameMount, count(nameMount) from clumber_view
group by nameMount;

Предусмотреть разработку триггеров, обеспечивающих каскадные изменения в связанных таблицах.
INSERT INTO `Climbing` SET route_idroute = OLD.idroute;

DELIMITER $$
CREATE TRIGGER `route_id`
BEFORE DELETE ON `Climbing`
FOR EACH ROW
	BEGIN
	delete from `route` where idroute = OLD.route_idroute;
	delete from `Clumber` where idClumber = OLD.IDClumber;
	END$$
DELIMITER ;

delete from Climbing where idClimb = 1;


drop trigger route_id;






















