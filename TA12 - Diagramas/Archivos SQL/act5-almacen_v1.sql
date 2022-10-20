CREATE DATABASE almacen_v1;
USE almacen_v1;

CREATE TABLE piezas(
id_pieza INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(60),
modelo VARCHAR(60),
descripcion VARCHAR(100),
precio DOUBLE
);

CREATE TABLE se_compone(
id_pieza INT,
FOREIGN KEY(id_pieza) REFERENCES piezas(id_pieza)
);

CREATE TABLE estanteria(
id_estanteria INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(25),
num_piezas INT
);

CREATE TABLE almacena(
id_pieza INT,
id_estanteria INT,
FOREIGN KEY(id_pieza) REFERENCES piezas(id_pieza)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_estanteria) REFERENCES estanteria(id_estanteria)
ON DELETE CASCADE ON UPDATE CASCADE
);

USE almacen_v1;
INSERT INTO piezas(tipo,modelo,descripcion,precio) VALUES
('tipo1','modelo1','descripcion1',12.99),
('tipo2','modelo2','descripcion2',13.99),
('tipo3','modelo3','descripcion3',14.99),
('tipo4','modelo4','descripcion4',15.99),
('tipo5','modelo5','descripcion5',16.99),
('tipo6','modelo6','descripcion6',17.99),
('tipo7','modelo7','descripcion7',18.99),
('tipo8','modelo8','descripcion8',19.99),
('tipo9','modelo9','descripcion9',20.99),
('tipo10','modelo10','descripcion10',10.99);

INSERT INTO se_compone(id_pieza) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10);

INSERT INTO estanteria(nombre,num_piezas) VALUES
('nombre1',10),
('nombre2',11),
('nombre3',12),
('nombre4',13),
('nombre5',14),
('nombre6',15),
('nombre7',16),
('nombre8',17),
('nombre9',18),
('nombre10',19);

INSERT INTO almacena(id_pieza,id_estanteria) VALUES
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