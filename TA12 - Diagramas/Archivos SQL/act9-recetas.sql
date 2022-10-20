CREATE DATABASE recetas;
USE recetas;

CREATE TABLE recetas(
id_receta INT PRIMARY KEY AUTO_INCREMENT,
nombre varchar(30),
duracion TIME
);

CREATE TABLE platos(
id_plato INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30)
);

CREATE TABLE prepara_platos(
id_receta INT,
id_plato INT,
FOREIGN KEY(id_receta) REFERENCES recetas(id_receta)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_plato) REFERENCES platos(id_plato)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ingredientes(
id_ingrediente INT PRIMARY KEY AUTO_INCREMENT,
nombre varchar(25),
cantidad INT
);

CREATE TABLE usa_ingredientes(
id_receta INT,
id_ingrediente INT,
FOREIGN KEY(id_receta) REFERENCES recetas(id_receta)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_ingrediente) REFERENCES ingredientes(id_ingrediente)
ON DELETE CASCADE ON UPDATE CASCADE
);

USE recetas;
INSERT INTO recetas(nombre,duracion) VALUES
('nombre1','00:30:00'),
('nombre2','00:15:00'),
('nombre3','00:17:00'),
('nombre4','00:19:00'),
('nombre5','00:12:00'),
('nombre6','00:15:00'),
('nombre7','00:13:00'),
('nombre8','00:15:00'),
('nombre9','00:11:00'),
('nombre10','00:10:00');

INSERT INTO platos(nombre) VALUES
('plato1'),
('plato2'),
('plato3'),
('plato4'),
('plato5'),
('plato6'),
('plato7'),
('plato8'),
('plato9'),
('plato10');

INSERT INTO prepara_platos(id_receta,id_plato) VALUES
(1,9),
(2,8),
(3,7),
(4,6),
(5,10),
(6,5),
(7,4),
(8,3),
(9,2),
(10,1);

INSERT INTO ingredientes(nombre,cantidad) VALUES
('ing1',10),
('ing2',12),
('ing3',13),
('ing4',16),
('ing5',18),
('ing6',19),
('ing7',12),
('ing8',11),
('ing9',10),
('ing10',15);

INSERT INTO usa_ingredientes(id_receta,id_ingrediente) VALUES
(1,10),
(2,9),
(3,8),
(4,7),
(5,6),
(6,5),
(7,4),
(8,3),
(9,2),
(10,1);