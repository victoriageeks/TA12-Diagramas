CREATE DATABASE inmuebles;
USE inmuebles;

CREATE TABLE cliente(
DNI VARCHAR(8) PRIMARY KEY,
telf_fijo INT,
movil INT,
nombre VARCHAR(25),
apellidos VARCHAR(60),
cod_pers INT 
);

CREATE TABLE trabajador(
id_trabajador INT PRIMARY KEY AUTO_INCREMENT,
DNI VARCHAR(8),
FOREIGN KEY(DNI) REFERENCES cliente(DNI)
);

CREATE TABLE inmuebles(
cod_inmueble INT PRIMARY KEY AUTO_INCREMENT,
metros DOUBLE,
descripcion VARCHAR(100),
direccion VARCHAR(100)
);

CREATE TABLE garaje(
cod_garaje INT PRIMARY KEY AUTO_INCREMENT,
planta INT,
cod_inmueble INT,
FOREIGN KEY(cod_inmueble) REFERENCES inmuebles(cod_inmueble)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE pisos(
cod_piso INT PRIMARY KEY AUTO_INCREMENT,
cod_inmueble INT,
cod_garaje INT,
FOREIGN KEY(cod_inmueble) REFERENCES inmuebles(cod_inmueble)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(cod_garaje) REFERENCES garaje(cod_garaje)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE locales(
cod_local INT PRIMARY KEY AUTO_INCREMENT,
servicio BIT,
uso VARCHAR(200),
cod_inmueble INT,
FOREIGN KEY(cod_inmueble) REFERENCES inmuebles(cod_inmueble)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE otros(
cod_otros INT PRIMARY KEY AUTO_INCREMENT,
cod_inmueble INT,
FOREIGN KEY(cod_inmueble) REFERENCES inmuebles(cod_inmueble)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE compra(
cod_compra INT PRIMARY KEY AUTO_INCREMENT,
valor DOUBLE,
fecha DATE,
num_titulares INT,
DNI VARCHAR(8),
cod_inmueble INT,
FOREIGN KEY(DNI) REFERENCES cliente(DNI)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(cod_inmueble) REFERENCES inmuebles(cod_inmueble)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE alquiler(
id_alquiler INT PRIMARY KEY AUTO_INCREMENT,
num_alquiler INT,
cod_inmueble INT,
DNI VARCHAR(8),
id_trabajador INT,
FOREIGN KEY(cod_inmueble) REFERENCES inmuebles(cod_inmueble)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(DNI) REFERENCES cliente(DNI)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_trabajador) REFERENCES trabajador(id_trabajador)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE pagos(
id_pago INT PRIMARY KEY AUTO_INCREMENT,
anio INT,
mes INT,
valor INT,
id_alquiler INT,
FOREIGN KEY(id_alquiler) REFERENCES alquiler(id_alquiler)
ON DELETE CASCADE ON UPDATE CASCADE
);

USE inmuebles;
INSERT INTO cliente(DNI,telf_fijo,movil,nombre,apellidos,cod_pers) VALUES
('12345678',977111222,690111888,'nombre1','apellidos1',20),
('12345677',977111223,690111887,'nombre2','apellidos2',21),
('12345676',977111224,690111886,'nombre3','apellidos3',22),
('12345675',977111225,690111885,'nombre4','apellidos4',23),
('12345674',977111226,690111884,'nombre5','apellidos5',24),
('12345673',977111227,690111883,'nombre6','apellidos6',25),
('12345672',977111228,690111882,'nombre7','apellidos7',26),
('12345671',977111229,690111881,'nombre8','apellidos8',27),
('12345670',977111220,690111880,'nombre9','apellidos9',28),
('12345679',977111221,690111889,'nombre0','apellidos0',29);


INSERT INTO trabajador(DNI) VALUES
('12345678'),
('12345677'),
('12345676'),
('12345675'),
('12345674'),
('12345673'),
('12345672'),
('12345671'),
('12345670'),
('12345679');

INSERT INTO inmuebles(metros,descripcion,direccion) VALUES
(150.50,'descripcion1','direccion1'),
(150.50,'descripcion2','direccion2'),
(135.50,'descripcion3','direccion3'),
(180.50,'descripcion4','direccion4'),
(160.50,'descripcion5','direccion5'),
(178.50,'descripcion6','direccion6'),
(139.50,'descripcion7','direccion7'),
(117.50,'descripcion8','direccion8'),
(150.50,'descripcion9','direccion9'),
(175.90,'descripcion10','direccion10');

INSERT INTO garaje(planta,cod_inmueble) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

INSERT INTO pisos(cod_inmueble,cod_garaje) VALUES
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

INSERT INTO locales(servicio,uso,cod_inmueble) VALUES
(1,'uso1',1),
(0,'uso2',2),
(1,'uso3',3),
(0,'uso4',4),
(0,'uso5',5),
(1,'uso6',6),
(1,'uso7',7),
(0,'uso8',8),
(1,'uso9',9),
(0,'uso10',10);

INSERT INTO otros(cod_inmueble) VALUES
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

INSERT INTO compra(valor,fecha,num_titulares,DNI,cod_inmueble) VALUES
(199009,'2022-10-15',1,'12345678',1),
(350000.89,'2022-10-13',2,'12345677',2),
(200000,'2022-10-16',1,'12345676',3),
(76009,'2022-10-19',1,'12345675',4),
(59999,'2022-10-18',3,'12345674',5),
(356789,'2022-10-30',1,'12345673',6),
(235679,'2022-10-09',2,'12345672',7),
(145789,'2022-10-08',1,'12345671',8),
(198798,'2022-10-07',1,'12345670',9),
(234987.60,'2022-10-01',1,'12345679',10);

INSERT INTO alquiler(num_alquiler,cod_inmueble,DNI,id_trabajador) VALUES
(111,1,'12345678',1),
(222,2,'12345677',2),
(333,3,'12345676',3),
(444,4,'12345675',4),
(555,5,'12345674',5),
(666,6,'12345673',6),
(777,7,'12345672',7),
(888,8,'12345671',8),
(110,9,'12345670',9),
(113,10,'12345679',10);

INSERT INTO pagos(anio,mes,valor,id_alquiler) VALUES
(2022,10,1000,1),
(2022,09,1200,2),
(2022,08,1300,3),
(2022,10,1200,4),
(2022,11,1110,5),
(2022,12,1230,6),
(2022,09,1560,7),
(2022,10,1120,8),
(2022,10,1000,9),
(2022,07,1000,10);
