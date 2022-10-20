CREATE SCHEMA Empresa_Comidas_13_18;
USE Empresa_Comidas_13_18;

CREATE TABLE Empleado(
id_empleado INT NOT NULL AUTO_INCREMENT,
dni VARCHAR(9),
ss INT NOT NULL,
tel_fijo INT,
tel_movil INT,
KEY (id_empleado)
);

CREATE TABLE Cocinero(
id_empleado INT NOT NULL,
fecha_inicial DATE,
FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado)
);

CREATE TABLE Pinche(
id_empleado INT NOT NULL,
id_encargado INT NOT NULL,
fecha_nacimiento DATE,
FOREIGN KEY (id_empleado) REFERENCES Empleado(id_empleado),
FOREIGN KEY (id_encargado) REFERENCES Cocinero(id_empleado)
);

CREATE TABLE Plato(
id_plato INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(20),
tipo VARCHAR(20),
precio DOUBLE,
KEY (id_plato)
);

CREATE TABLE CocineroPlato(
id_cocinero INT NOT NULL,
id_plato INT NOT NULL,
FOREIGN KEY (id_cocinero) REFERENCES Cocinero (id_empleado),
FOREIGN KEY (id_plato) REFERENCES Plato (id_plato)
);

CREATE TABLE Ingrediente(
id_ingrediente INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(20),
KEY (id_ingrediente)
);

CREATE TABLE PlatoIngrediente(
id_ingrediente INT NOT NULL,
id_plato INT NOT NULL,
FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente (id_ingrediente),
FOREIGN KEY (id_plato) REFERENCES Plato (id_plato)
);

CREATE TABLE Almacen(
id_almacen INT NOT NULL AUTO_INCREMENT,
numero INT,
descripcion VARCHAR(200),
nombre VARCHAR(20),
KEY (id_almacen)
);

CREATE TABLE Estante(
id_estante INT NOT NULL AUTO_INCREMENT,
id_almacen INT NOT NULL,
letra1 VARCHAR(1),
letra2 VARCHAR(1),
tamaño SMALLINT,
KEY (id_estante),
FOREIGN KEY (id_almacen) REFERENCES Almacen (id_almacen)
);

CREATE TABLE EstanteIngrediente(
id_ingrediente INT NOT NULL,
id_estante INT NOT NULL,
cantidad INT DEFAULT 0,
tipo VARCHAR(3),
FOREIGN KEY (id_ingrediente) REFERENCES Ingrediente (id_ingrediente),
FOREIGN KEY (id_estante) REFERENCES Estante (id_estante)
);


INSERT INTO Empleado(dni,ss,tel_fijo,tel_movil) VALUES(41046881,123456,602509473,602505435);
INSERT INTO Empleado(dni,ss,tel_fijo,tel_movil) VALUES(31046882,123476,602509473,602509476);
INSERT INTO Empleado(dni,ss,tel_fijo,tel_movil) VALUES(21046883,123486,602509473,602509499);
INSERT INTO Empleado(dni,ss,tel_fijo,tel_movil) VALUES(11046884,123496,602509473,602509653);
INSERT INTO Empleado(dni,ss,tel_fijo,tel_movil) VALUES(51046885,123406,602509473,602509544);
INSERT INTO Empleado(dni,ss,tel_fijo,tel_movil) VALUES(61046886,123126,602509473,602509324);
INSERT INTO Empleado(dni,ss,tel_fijo,tel_movil) VALUES(71046887,1232146,60250943,602502394);
INSERT INTO Empleado(dni,ss,tel_fijo,tel_movil) VALUES(81046888,1234552,60250973,602509656);
INSERT INTO Empleado(dni,ss,tel_fijo,tel_movil) VALUES(91046898,1234545,60250473,602509763);
INSERT INTO Empleado(dni,ss,tel_fijo,tel_movil) VALUES(01046889,1234876,60259473,602509233);

INSERT INTO Cocinero(id_empleado,fecha_inicial) VALUES(1,"2012-11-10");
INSERT INTO Cocinero(id_empleado,fecha_inicial) VALUES(2,"2015-10-9");
INSERT INTO Cocinero(id_empleado,fecha_inicial) VALUES(3,"2018-03-10");

INSERT INTO Pinche(id_empleado,id_encargado,fecha_nacimiento) VALUES(4,1,"2000-03-12");
INSERT INTO Pinche(id_empleado,id_encargado,fecha_nacimiento) VALUES(5,1,"2001-05-10");
INSERT INTO Pinche(id_empleado,id_encargado,fecha_nacimiento) VALUES(6,3,"2002-09-10");
INSERT INTO Pinche(id_empleado,id_encargado,fecha_nacimiento) VALUES(7,1,"1998-12-12");
INSERT INTO Pinche(id_empleado,id_encargado,fecha_nacimiento) VALUES(8,2,"1998-11-10");
INSERT INTO Pinche(id_empleado,id_encargado,fecha_nacimiento) VALUES(9,2,"2005-03-10");
INSERT INTO Pinche(id_empleado,id_encargado,fecha_nacimiento) VALUES(10,3,"2001-10-01");


INSERT INTO Plato(nombre,tipo,precio) VALUES("ARROZ TURCO","primer plato",20);
INSERT INTO Plato(nombre,tipo,precio) VALUES("PIZZA MARGARITA","segundo plato",8);
INSERT INTO Plato(nombre,tipo,precio) VALUES("ChocoTorta","Postre",5);

INSERT INTO CocineroPlato(id_cocinero,id_plato) VALUES(1,1);
INSERT INTO CocineroPlato(id_cocinero,id_plato) VALUES(1,2);
INSERT INTO CocineroPlato(id_cocinero,id_plato) VALUES(1,3);
INSERT INTO CocineroPlato(id_cocinero,id_plato) VALUES(2,2);
INSERT INTO CocineroPlato(id_cocinero,id_plato) VALUES(3,3);

INSERT INTO Ingrediente(nombre) VALUES("Arroz");
INSERT INTO Ingrediente(nombre) VALUES("Cebolla");
INSERT INTO Ingrediente(nombre) VALUES("Carne Molida");
INSERT INTO Ingrediente(nombre) VALUES("Aceite");
INSERT INTO Ingrediente(nombre) VALUES("Masa Pizza");
INSERT INTO Ingrediente(nombre) VALUES("QUESO");
INSERT INTO Ingrediente(nombre) VALUES("CHOCOLINAS");
INSERT INTO Ingrediente(nombre) VALUES("Dulce de leche");
INSERT INTO Ingrediente(nombre) VALUES("Pimiento");
INSERT INTO Ingrediente(nombre) VALUES("Aceituna");

INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(1,1);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(1,2);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(1,3);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(1,4);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(1,9);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente)VALUES(2,5);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(2,6);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(2,10);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(3,7);
INSERT INTO PlatoIngrediente(id_plato,id_ingrediente) VALUES(3,8);

INSERT INTO  Almacen(numero,descripcion,nombre) VALUES(1,"Almacen del primer Restaurante AL0157 Calle ribes","ROJOB1");

INSERT INTO Estante(id_almacen,letra1,letra2,tamaño)  VALUES(1,"A","A",100);
INSERT INTO Estante(id_almacen,letra1,letra2,tamaño)  VALUES(1,"A","B",100);
INSERT INTO Estante(id_almacen,letra1,letra2,tamaño)  VALUES(1,"A","C",100);
INSERT INTO Estante(id_almacen,letra1,letra2,tamaño)  VALUES(1,"A","D",100);
INSERT INTO Estante(id_almacen,letra1,letra2,tamaño)  VALUES(1,"A","E",100);
INSERT INTO Estante(id_almacen,letra1,letra2,tamaño)  VALUES(1,"A","F",100);
INSERT INTO Estante(id_almacen,letra1,letra2,tamaño)  VALUES(1,"B","A",120);
INSERT INTO Estante(id_almacen,letra1,letra2,tamaño)  VALUES(1,"B","B",120);
INSERT INTO Estante(id_almacen,letra1,letra2,tamaño)  VALUES(1,"B","C",120);
INSERT INTO Estante(id_almacen,letra1,letra2,tamaño)  VALUES(1,"B","D",120);


INSERT INTO EstanteIngrediente(id_ingrediente,id_estante,cantidad,tipo) values(1,1,3,"KG");
INSERT INTO EstanteIngrediente(id_ingrediente,id_estante,cantidad,tipo) values(2,2,5,"KG");
INSERT INTO EstanteIngrediente(id_ingrediente,id_estante,cantidad,tipo) values(3,3,3,"KG");
INSERT INTO EstanteIngrediente(id_ingrediente,id_estante,cantidad,tipo) values(4,4,10,"LTS");
INSERT INTO EstanteIngrediente(id_ingrediente,id_estante,cantidad,tipo) values(5,5,10,"KG");
INSERT INTO EstanteIngrediente(id_ingrediente,id_estante,cantidad,tipo) values(6,6,6,"KG");
INSERT INTO EstanteIngrediente(id_ingrediente,id_estante,cantidad,tipo) values(7,7,20,"UND");
INSERT INTO EstanteIngrediente(id_ingrediente,id_estante,cantidad,tipo) values(8,8,4,"KG");
INSERT INTO EstanteIngrediente(id_ingrediente,id_estante,cantidad,tipo) values(9,9,1,"KG");
INSERT INTO EstanteIngrediente(id_ingrediente,id_estante,cantidad,tipo) values(10,10,4,"KG");
