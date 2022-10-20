CREATE DATABASE accidentes;
USE accidentes;

CREATE TABLE accidente_g(
id_accidente INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(25),
pos_h DOUBLE,
pos_v DOUBLE
);

CREATE TABLE rios(
id_rio INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(25),
longitud DOUBLE,
id_accidente INT,
FOREIGN KEY(id_accidente) REFERENCES accidente_g(id_accidente)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE lagos(
id_lago INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(25),
extension DOUBLE,
id_accidente INT,
FOREIGN KEY(id_accidente) REFERENCES accidente_g(id_accidente)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE montanias(
id_montania INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(25),
altura DOUBLE,
id_accidente INT,
FOREIGN KEY(id_accidente) REFERENCES accidente_g(id_accidente)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE pais(
id_pais INT PRIMARY KEY,
nombre varchar(30),
extension DOUBLE,
poblacion INT
);

CREATE TABLE hay_accidente(
id_accidente INT,
id_pais INT,
FOREIGN KEY(id_accidente) REFERENCES accidente_g(id_accidente)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_pais) REFERENCES pais(id_pais)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE localidades(
id_localidad INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(30)
);

CREATE TABLE hay_localidades(
id_pais INT,
id_localidad INT,
FOREIGN KEY(id_pais) REFERENCES pais(id_pais)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_localidad) REFERENCES localidades(id_localidad)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE hay_rios(
id_rio INT,
id_localidad INT,
FOREIGN KEY(id_rio) REFERENCES rios(id_rio)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_localidad) REFERENCES localidades(id_localidad)
ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO accidente_g(nombre,pos_h,pos_v) VALUES
('nombre1',980.78,993.20),
('nombre2',991.78,992.20),
('nombre3',982.78,991.20),
('nombre4',983.78,992.20),
('nombre5',984.78,994.20),
('nombre6',985.78,995.20),
('nombre7',986.78,996.20),
('nombre8',987.78,997.20),
('nombre9',988.78,998.20),
('nombre10',989.78,989.20);

INSERT INTO rios(nombre,longitud,id_accidente) VALUES
('rio1',1230.90,1),
('rio2',1231.90,2),
('rio3',1232.90,3),
('rio4',1233.90,4),
('rio5',1234.90,5),
('rio6',1235.90,6),
('rio7',1236.90,7),
('rio8',1237.90,8),
('rio9',1238.90,9),
('rio10',1239.90,10);

INSERT INTO lagos(nombre,extension,id_accidente) VALUES
('lago1',987.57,1),
('lago2',986.57,2),
('lago3',985.57,3),
('lago4',984.57,4),
('lago5',983.57,5),
('lago6',982.57,6),
('lago7',981.57,7),
('lago8',980.57,8),
('lago9',989.57,9),
('lago10',988.57,10);

INSERT INTO montanias(nombre,altura,id_accidente) VALUES
('montania1',230.50,1),
('montania2',231.50,2),
('montania3',232.50,3),
('montania4',233.50,4),
('montania5',234.50,5),
('montania6',235.50,6),
('montania7',236.50,7),
('montania8',237.50,8),
('montania9',239.50,9),
('montania10',238.50,10);

INSERT INTO pais(id_pais,nombre,extension,poblacion) VALUES
(111,'pais1',200000,500000),
(222,'pais2',100000,600000),
(333,'pais3',200000,600000),
(444,'pais4',400000,700000),
(555,'pais5',500000,800000),
(666,'pais6',600000,900000),
(777,'pais7',700000,230000),
(888,'pais8',800000,560000),
(998,'pais9',900000,450000),
(997,'pais10',220000,360000);

INSERT INTO hay_accidente(id_accidente,id_pais) VALUES
(1,111),
(2,222),
(3,333),
(4,444),
(5,555),
(6,666),
(7,777),
(8,888),
(9,998),
(10,997);

INSERT INTO localidades(nombre) VALUES
('localidad1'),
('localidad2'),
('localidad3'),
('localidad4'),
('localidad5'),
('localidad6'),
('localidad7'),
('localidad8'),
('localidad9'),
('localidad10');

INSERT INTO hay_localidades(id_pais,id_localidad) VALUES
(111,1),
(222,2),
(333,3),
(444,4),
(555,5),
(666,6),
(777,7),
(888,8),
(998,9),
(997,10);

INSERT INTO hay_rios(id_rio,id_localidad) VALUES
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
