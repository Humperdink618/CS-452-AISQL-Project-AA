INSERT INTO movie (movie_id, name, release_date, rating, director_id, producer_id, box_office, budget, imdb_score) VALUES
(1, 'Star Wars A New Hope', '1977-05-25', 'PG', 1, 1, 775400000.00, 11000000.00, 8.6),
(2, 'Star Wars The Empire Strikes Back', '1980-05-21', 'PG', 2, 1, 549000000.00, 30500000.00, 8.7),
(3, 'Star Wars Return of the Jedi', '1983-05-25', 'PG', 3, 2, 482000000.00, 42700000.00, 8.3),
(4, 'Star Wars The Phantom Menace', '1999-05-19', 'PG', 1, 3, 1047000000.00, 115000000.00, 6.5),
(5, 'Star Wars Attack of the Clones', '2002-05-12', 'PG', 1, 3, 653800000.00, 115000000.00, 6.6),
(6, 'Star Wars Revenge of the Sith', '2005-05-19', 'PG-13', 1, 3, 868400000.00, 113000000.00, 7.6),
(7, 'Star Wars The Force Awakens', '2015-12-18', 'PG-13', 4, 5, 2071000000.00, 447000000.00, 7.8),
(8, 'Star Wars The Last Jedi', '2017-12-09', 'PG-13', 5, 5, 1334000000.00, 300000000.00, 6.9),
(9, 'Star Wars The Rise of Skywalker', '2019-12-20', 'PG-13', 4, 5, 1077000000.00, 416000000.00, 6.4),
(10, 'Star Wars The Clone Wars', '2008-08-15', 'PG', 6, 4, 68300000.00, 8500000.00, 5.9),
(11, 'Rogue One: A Star Wars Story', '2016-12-16', 'PG-13', 7, 5, 1059000000.00, 280200000.00, 7.8),
(12, 'Solo: A Star Wars Story', '2018-05-25', 'PG-13', 8, 5, 393200000.00, 330400000.00, 6.9);

INSERT INTO producer (producer_id, name, birth_date) VALUES
(1, 'Gary Kurtz', '1940-07-27'),
(2, 'Howard Kanzanjian', '1942-07-26'),
(3, 'Rick McCallum', '1954-08-22'),
(4, 'Catherine Winder', NULL),
(5, 'Kathleen Kennedy', '1953-06-05');

INSERT INTO director (director_id, name, birth_date) VALUES
(1, 'George Lucas','1944-05-14'),
(2, 'Irvin Kershner', '1923-04-29'),
(3, 'Richard Marquand', '1937-09-22'),
(4, 'J.J. Abrams', '1966-06-27'),
(5, 'Rian Johnson', '1973-12-17'),
(6, 'Dave Filoni', '1974-06-07'),
(7, 'Gareth Edwards', '1975-07-13'),
(8, 'Ron Howard', '1954-03-01');

