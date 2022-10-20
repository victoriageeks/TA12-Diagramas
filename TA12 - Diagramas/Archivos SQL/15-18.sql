CREATE SCHEMA ac15_18;
USE ac15_18;

CREATE TABLE Menu(
id INT NOT NULL AUTO_INCREMENT,
fecha DATE,
KEY(ID)
);

CREATE TABLE Plato(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(20),
descripcion VARCHAR(40),
tipo VARCHAR(20),
KEY (ID)
);

CREATE TABLE Analisis(
id INT NOT NULL AUTO_INCREMENT,
id_menu INT NOT NULL,
temperatura VARCHAR(20),
venta INT,
clientes INT,
KEY(id),
FOREIGN KEY(id_menu) REFERENCES Menu(id)
);

CREATE TABLE MenuPlato(
id_menu INT,
id_plato INT,
FOREIGN KEY(id_menu) REFERENCES Menu(id),
FOREIGN KEY(id_plato) REFERENCES Plato(id)
);

INSERT INTO Plato(nombre,descripcion,tipo) VALUES("Arroz Turco","Arroz con pollo y verduras","Primer Plato");
INSERT INTO Plato(nombre,descripcion,tipo) VALUES("Crema","Crema de Verduras","Segundo Plato");
INSERT INTO Plato(nombre,descripcion,tipo) VALUES("Margarita","Pizza Margarita con Oregano","Primer Plato");
INSERT INTO Plato(nombre,descripcion,tipo) VALUES("Pastollo","Pasta con salsa y pollo","Primer Plato");
INSERT INTO Plato(nombre,descripcion,tipo) VALUES("Chocotorta","Chocolinas con dulce de leche","Postre");

INSERT INTO Menu(fecha) VALUES("2022-01-20");
INSERT INTO Menu(fecha) VALUES("2022-01-21");

INSERT INTO MenuPlato(id_menu,id_plato) VALUES(1,1);
INSERT INTO MenuPlato(id_menu,id_plato) VALUES(1,2);
INSERT INTO MenuPlato(id_menu,id_plato) VALUES(1,5);
INSERT INTO MenuPlato(id_menu,id_plato) VALUES(2,3);
INSERT INTO MenuPlato(id_menu,id_plato) VALUES(2,4);
INSERT INTO MenuPlato(id_menu,id_plato) VALUES(2,5);

INSERT INTO Analisis(id_menu,temperatura, venta,clientes) VALUES(1,"20C soleado",400,45);
INSERT INTO Analisis(id_menu,temperatura, venta,clientes) VALUES(2,"28c nublado",150,30);