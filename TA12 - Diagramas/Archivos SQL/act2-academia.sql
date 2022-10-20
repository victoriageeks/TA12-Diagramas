CREATE DATABASE academia_clases;
USE academia_clases;

CREATE TABLE alumnos(
DNI VARCHAR(8) PRIMARY KEY,
direccion VARCHAR(100),
nombre VARCHAR(100),
telefono INT,
edad int
);

CREATE TABLE trabajador(
CIF VARCHAR(9) PRIMARY KEY,
direccion_empresa VARCHAR(60),
DNI VARCHAR(8),
FOREIGN KEY (DNI) REFERENCES alumnos(DNI)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE profesores(
DNI_profesor VARCHAR(8) PRIMARY KEY,
nombre VARCHAR(25),
apellidos VARCHAR(100),
direccion VARCHAR(100),
telefono INT
);

CREATE TABLE desempleado(
id_desempleado INT PRIMARY KEY AUTO_INCREMENT,
DNI VARCHAR(8),
FOREIGN KEY (DNI) REFERENCES alumnos(DNI)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE cursos(
cod_curso INT PRIMARY KEY AUTO_INCREMENT,
programa_curso INT,
num_curso INT,
duracion INT,
titulo VARCHAR(60),
fecha_inicio DATE,
fecha_fin DATE,
DNI VARCHAR(9),
DNI_profesor VARCHAR(9),
FOREIGN KEY (DNI) REFERENCES alumnos (DNI)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(DNI_profesor) REFERENCES profesores(DNI_profesor)
ON DELETE CASCADE ON UPDATE CASCADE
);

USE academia_clases;
INSERT INTO alumnos(DNI,direccion,nombre,telefono,edad) VALUES
('12345678','Calle Alarcón','Maria',640987900,20),
('12345677','Calle López','Eva',640987901,21),
('12345676','Calle De la Vega','Emma',640987902,22),
('12345675','Calle Martínez','Eduardo',640987903,22),
('12345674','Calle Carola','Alberto',640987904,23),
('12345673','Calle Herrera','Victoria',640987905,24),
('12345672','Calle Recasens','Mireia',640987906,25),
('12345671','Calle Bieber','Selena',640987907,26),
('12345670','Calle Gomez','Justin',640987908,27),
('12345679','Calle Marisol','Hailey',640987909,28);

INSERT INTO trabajador(CIF,direccion_empresa,DNI) VALUES
('111222333','direccion1','12345678'),
('111222334','direccion2','12345677'),
('111222335','direccion3','12345676'),
('111222332','direccion4','12345675'),
('111222336','direccion5','12345674'),
('111222337','direccion6','12345673'),
('111222338','direccion7','12345672'),
('111222339','direccion8','12345671'),
('111222330','direccion9','12345670'),
('111222331','direccion10','12345679');

INSERT INTO profesores(DNI_profesor,nombre,apellidos,direccion,telefono) VALUES
('98765431','maria','martinez','direccion11',674987099),
('98765432','carmen','lopez','direccion12',674987098),
('98765433','carol','marin','direccion13',674987097),
('98765434','carla','martinez','direccion14',674987096),
('98765435','eva','herrero','direccion15',674987095),
('98765436','joel','borga','direccion16',674987094),
('98765437','javi','recasens','direccion17',674987093),
('98765438','dani','torres','direccion18',674987092),
('98765439','ivan','cebrian','direccion19',674987091),
('98765430','carlos','lavega','direccion10',674987090);

INSERT INTO desempleado(DNI) VALUES
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

INSERT INTO cursos(programa_curso,num_curso,duracion,titulo,fecha_inicio,fecha_fin,DNI,DNI_profesor) VALUES
(1,2,30,'titulo1','2022-10-01','2022-11-30','12345678','98765431'),
(2,3,30,'titulo2','2022-10-03','2022-11-29','12345677','98765432'),
(3,4,30,'titulo3','2022-10-04','2022-11-28','12345676','98765433'),
(4,5,30,'titulo4','2022-10-05','2022-11-27','12345675','98765434'),
(5,6,30,'titulo5','2022-10-06','2022-11-26','12345674','98765435'),
(6,7,30,'titulo6','2022-10-07','2022-11-25','12345673','98765436'),
(7,8,30,'titulo7','2022-10-08','2022-11-24','12345672','98765437'),
(8,9,30,'titulo8','2022-10-09','2022-11-23','12345671','98765438'),
(9,10,30,'titulo9','2022-10-10','2022-11-22','12345670','98765439'),
(11,12,30,'titulo10','2022-10-11','2022-11-21','12345679','98765430');




