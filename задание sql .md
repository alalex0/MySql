1 Создать таблицу  для хранения информации о книгах. Таблица создаётся со столбцами: id, название, описание, цена, количество на складе, количество страниц, изображение, автор (id_author). Таблицу с авторами создавать не нужно. 
С типами данных определиться самостоятельно. 

CREATE DATABASE library;
USE library;
CREATE TABLE IF NOT EXISTS books(
`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(255) NOT NULL,
`descript` MEDIUMTEXT NOT NULL,
`price` FLOAT NOT NULL,
`count_book` INT NOT NULL,
`count_page` INT NOT NULL,
`image` VARCHAR(255) NOT NULL,
`id_author` INT NOT NULL
) ENGINE=InnoDB;

2 Вставить данные в таблицу. 
INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('Мастер', 'уникальное литературное детище, ставшее оружием в руках писателя', 1000, 15, 460, 'master.jpg', 1);
INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('Война и мир', 'е просто классический роман, а настоящий героический эпос, литературная ценность которого не сравнима ни с одним другим произведением', 1500, 10, 560, 'tolstoy.jpg', 2);
INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('Братья Карамазовы', 'последний роман Ф. М. Достоевского, который автор писал два года. Роман был напечатан частями в журнале «Русский вестник».', 900, 5, 360, 'karamazovy.jpg', 3);
INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('Бесы', 'опубликован в 1871-1872 годах. На создание этого романа Ф. М. Достоевского подтолкнула сложная политическая ситуация в стране и зарождение террористического и радикального движения. Структура романа очень сложна, а истоки полемики между героями стоит искать еще в «Преступлении и наказании». Действие романа происходит в губернском городе в поместье Варвары Ставрогиной', 850, 23, 470, 'besy.jpg', 3);
INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('Слабое сердце', 'опубликована в 1848 году. В центре повествования находится бедный молодой чиновник Вася Шумков, который собирается жениться. Он ответственный работник, которому начальник поручает переписывать документы. Вася из-за предстоящей свадьбы часто отвлекался от работы, а по ночам не щадил себя. Нервное напряжение и желание всё сделать вовремя сыграли злую шутку с молодым человеком.', 1800, 14, 60, 'heart.jpg', 3);

INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('Евгений Онегин', 'История создания «Евгений Онегин» по праву стоит особняком среди произведений русской литературы 19 века.', 700, 50, 320, 'onegin.jpg', 4);

INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('Изучаем программирование на Python', 'Надоело продираться через дебри малопонятных самоучителей по программированию? С этой книгой вы без труда усвоите азы Python и научитесь работать со структурами и функциями. В ходе обучения вы создадите свое собственное веб-приложение и узнаете, как управлять базами данных, обрабатывать исключения, пользоваться контекстными менеджерами, декораторами и генераторами. Все это и многое другое - во втором издании "Изучаем программирование на Python".', 1135, 5, 430, 'barripol.jpg', 5);
INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('Сам себе программист', 'Автор книги всего за год научился программировать, что само по себе немало. Однако Кори Альтхофф пошел дальше, и научившись программировать, он устроился разработчиком в одну из самых серьезных современных IT компаний - Ebay. Как ему удалось? Читайте эту книгу, изучайте программирование на языке Python по уникальной авторской методике - вам это тоже по силам! ', 700, 25, 260, 'althoff.jpg', 6);
INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('100 чудес природы России', 'Серия книг о самых лучших в мире местах и достижениях человечества. В каждой книге представлены 100 чудес природы по теме с красочными иллюстрациями, интересными описаниями и полезной информацией. ', 1300, 12, 120, 'natures.jpg', 7);
INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('Петербург, где мы живём', 'Серия книг о самых лучших в мире местах и достижениях человечества. В каждой книге представлены 100 чудес природы по теме с красочными иллюстрациями, интересными описаниями и полезной информацией. ', 1100, 5, 200, 'natures.jpg', 2);
INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('100 чудес природы России', 'Модерн и конструктивизм, советский модернизм и неоклассика, "дома-стаканы" и "дома на ножках" ', 450, 1, 250, 'Village.jpg', 2);
INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('Бизнес как система. Инструменты Black Star', 'БестселлерНовинка
Бизнес как система. Инструменты Black Star', 650, 5, 200, 'Black.jpg', 2);
INSERT INTO books(name, descript, price, count_book, count_page, image, id_author) VALUES ('Ателье волшебных кукол', 'Екатерина Кононова – создательница текстильных кукол.', 500, 4, 100, 'ekakonontoys.jpg', 2);

3 Вывести название, цену и изображение книг с ценой от 500 до 1500. Сортировка по убыванию. 

SELECT name, price, image FROM books WHERE price BETWEEN 500 AND 1500 ORDER BY price DESC;


mysql> SELECT name, price, image FROM books WHERE price > 500 AND price < 1500 ORDER BY price DESC;
+-------------------------------------------------------------+-------+----------------+
| name                                                        | price | image          |
+-------------------------------------------------------------+-------+----------------+
| 100 чудес природы России                                    |  1300 | natures.jpg    |
| Изучаем программирование на Python                          |  1135 | barripol.jpg   |
| Мастер и Маргарита                                          |  1000 | master.jpg     |
| Братья Карамазовы                                           |   900 | karamazovy.jpg |
| Евгений Онегин                                              |   700 | onegin.jpg     |
| Сам себе программист                                        |   700 | althoff.jpg    |
+-------------------------------------------------------------+-------+----------------+



4 Вывести названия и описание  книг с id автора равным 3. Сортировка по возрастанию. 

SELECT name, descript FROM books WHERE id_author=3 ORDER BY price;
SELECT name, descript FROM aticalkey.books WHERE id_author=3 ORDER BY id;

+-----------------------------------+
| name                              | descript
+-----------------------------------+
| Братья Карамазовы                 |
| Слабое сердце                     |
| Бесы                              |
+-----------------------------------+




5 Вывести цену книг, которых на складе меньше 10. 

mysql> SELECT price FROM books WHERE count_book < 10;
+-------+
| price |
+-------+
|   900 |
|  1135 |
+-------+

6 Вывести всю информацию о книгах, в описании которых встречается слово 'природа'. 
SELECT * FROM books WHERE descript LIKE '%природ%';
SELECT * FROM aticalkey.books WHERE descript LIKE '%природ%';

7 Вывести названия 5ти  книг, у которых цена меньше 1700 и id автора 2.

SELECT name, id_author FROM books WHERE price < 1700 AND id_author=2 LIMIT 5;

8 Вывести количество книг на складе название которых начинается со слова 'программирование', сортировать по возрастанию. 
SELECT count_book FROM books WHERE name LIKE 'программирование%' ORDER BY id;

9 Вывести всю информацию о книгах, у которых id автора не 5.

mysql> SELECT * FROM books WHERE NOT id_author=5;
+-----------+--------------------------------------------+
| id_author | name                                       |etc
+-----------+--------------------------------------------+
|         1 | Мастер и Маргарита                         |
|         2 | Война и мир                                |
|         3 | Братья Карамазовы                          |
|         4 | Евгений Онегин                             |
|         6 | Сам себе программист                       |
|         7 | 100 чудес природы России                   |
|         3 | Слабое сердце                              |
|         3 | Бесы                                       |
+-----------+--------------------------------------------+



Дз на субботу 
1 товары, которых нет в корзине ( например 1)
2 средний чек по трем корзинам
3 максимальны и минимальный чек

mysql> show tables;
+--------------------+
| Tables_in_function |
+--------------------+
| cart               |
| cart_good          |
| good               |
+--------------------+
3 rows in set (0,01 sec)

mysql> select * from cart;
+--------+
| idCart |
+--------+
|      1 |
|      2 |
|      3 |
+--------+
3 rows in set (0,09 sec)

mysql> select * from cart_good;
+--------+--------+--------+
| idGood | idCart | amount |
+--------+--------+--------+
|      1 |      1 |      2 |
|      1 |      2 |      2 |
|      2 |      1 |      2 |
|      2 |      3 |      3 |
|      3 |      1 |      2 |
|      3 |      2 |      3 |
|      3 |      3 |      3 |
|      4 |      1 |      1 |
|      4 |      2 |      4 |
|      5 |      1 |      1 |
|      5 |      3 |      1 |
+--------+--------+--------+
11 rows in set (0,00 sec)

mysql> select * from good;
+--------+--------------+--------+-------+
| idGood | name         | amount | price |
+--------+--------------+--------+-------+
|      1 | Шапка        |     10 |   400 |
|      2 | Кеды         |      5 |   500 |
|      3 | Лыжи         |      4 |   800 |
|      4 | Пальто       |      2 |  1200 |
|      5 | Носки        |     45 |   100 |
+--------+--------------+--------+-------+


1 товары, которых нет в корзине ( например 1)
CREATE VIEW view_cart AS select c.idCart, g.name, c.idGood
from good g
INNER JOIN  cart_good c where
g.idGood=c.idGood AND c.idCart=2;
CREATE VIEW v AS select c.idCart, SUM(c.amount*g.price)
AS res FROM cart_good c, good g
where c.idGood=g.idGood
group by c.idCart having SUM(c.amount*g.price);


3 максимальны и минимальный чек

Создаем таблицу стоимости по заказм
Записываем в представление

CREATE VIEW view_cart AS select c.idCart, g.name, c.idGood
from good g
INNER JOIN  cart_good c where
g.idGood=c.idGood AND c.idCart=2;

+--------+--------------+--------+
| idCart | name         | idGood |
+--------+--------------+--------+
|      2 | Шапка        |      1 |
|      2 | Лыжи         |      3 |
|      2 | Пальто       |      4 |
+--------+--------------+--------+

select g.idGood, g.name as res from
view_cart v
right join good g
on g.idGood=v.idGood
where v.idGood is null;

Товар которого нет в корзине.
+--------+------------+
| idGood | res        |
+--------+------------+
|      2 | Кеды       |
|      5 | Носки      |
+--------+------------+


mysql> select * from view_res;                                                                                                                 +--------+------+
| idCart | res  |
+--------+------+
|      1 | 4700 |
|      2 | 8000 |
|      3 | 4000 |
+--------+------+


SELECT max(res) FROM view_res;

+----------+
| max(res) |
+----------+
|     8000 |

SELECT MIN(res) FROM view_res;
+----------+
| min(res) |
+----------+
|     4000 |

2 средний чек по трем корзинам

SELECT AVG(res) as avereg_chek FROM view_res;

+---------------------+
|  avereg_chek |
+---------------------+
|           5566.6667 |
+---------------------+





















