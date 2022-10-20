CREATE SCHEMA Escuela_17_18;
USE Escuela_17_18;

CREATE TABLE Profesor(
id_profesor INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(20),
apellido VARCHAR(20),
direccion VARCHAR(30),
telefono INT,
dni VARCHAR(8),
n_seguridad_social INT,
KEY(id_profesor)
);

CREATE TABLE Aula(
codigo VARCHAR(10) NOT NULL,
nombre VARCHAR(20),
numero SMALLINT,
tamaño VARCHAR(20),
KEY (codigo)
);

CREATE TABLE Asignatura(
id_asignatura INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(20),
codigo_interno SMALLINT,
codigo_europeo SMALLINT,
KEY (id_asignatura)
);

CREATE TABLE Imparte(
id_imparte INT NOT NULL AUTO_INCREMENT,
id_profesor INT NOT NULL,
id_asignatura INT NOT NULL,
fecha_inicio DATE,
fecha_fin DATE,
KEY (id_imparte),
FOREIGN KEY (id_profesor) REFERENCES  Profesor (id_profesor),
FOREIGN KEY (id_asignatura) REFERENCES Asignatura (id_asignatura)
);

CREATE TABLE Ciclo(
id_ciclo INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(20),
tipo VARCHAR(20),
codigo_europeo INT NOT NULL,
KEY (id_ciclo)
);

CREATE TABLE AsignaturaCiclo(
id_asignatura INT NOT NULL,
id_ciclo INT NOT NULL,
FOREIGN KEY (id_asignatura) REFERENCES Asignatura (id_asignatura),
FOREIGN KEY (id_ciclo) REFERENCES Ciclo (id_ciclo)
);

CREATE TABLE ControlAsignatura(
id_asignatura1 INT NOT NULL,
id_asignatura2 INT NOT NULL,
FOREIGN KEY (id_asignatura1) REFERENCES Asignatura (id_asignatura),
FOREIGN KEY (id_asignatura2) REFERENCES Asignatura (id_asignatura)
);

CREATE TABLE AulaAsignatura(
id_asignatura INT NOT NULL,
codigo VARCHAR(10) NOT NULL,
fecha DATE,
turno VARCHAR(2),
FOREIGN KEY (id_asignatura) REFERENCES Asignatura (id_asignatura),
FOREIGN KEY (codigo) REFERENCES Aula (codigo)
);
INSERT INTO Profesor(nombre,apellido,direccion,telefono,dni) VALUES("Alvaro","Bernabey","Arizala 9","6025947","43597789");
INSERT INTO Profesor(nombre,apellido,direccion,telefono,dni) VALUES("Nicolas","Bernabey","Arizala 11","6050944","43597783");
INSERT INTO Profesor(nombre,apellido,direccion,telefono,dni) VALUES("Antonella","Bernabey","Arizala 10","6050475","43597782");

INSERT INTO Aula(codigo,nombre,numero,tamaño) VALUES("aaa023","Mates1",1,"4*4mts");
INSERT INTO Aula(codigo,nombre,numero,tamaño) VALUES("bc023","Mates2",1,"5*5mts");
INSERT INTO Aula(codigo,nombre,numero,tamaño) VALUES("aeq23","IFORMATICA A2",1,"6*4mts");

INSERT INTO Asignatura(nombre,codigo_interno,codigo_europeo) VALUES("Matematica 1",1,11);
INSERT INTO Asignatura(nombre,codigo_interno,codigo_europeo) VALUES("Matematica 2",2,12);
INSERT INTO Asignatura(nombre,codigo_interno,codigo_europeo) VALUES("Matematica 3",3,13);
INSERT INTO Asignatura(nombre,codigo_interno,codigo_europeo) VALUES("Informatica 1",14,005);

INSERT INTO Imparte(id_profesor,id_asignatura,fecha_inicio) VALUES(1,1,"2020-03-03");
INSERT INTO Imparte(id_profesor,id_asignatura,fecha_inicio) VALUES(1,2,"2020-03-03");
INSERT INTO Imparte(id_profesor,id_asignatura,fecha_inicio) VALUES(2,3,"2018-03-03");
INSERT INTO Imparte(id_profesor,id_asignatura,fecha_inicio) VALUES(3,4,"2021-03-03");

INSERT INTO Ciclo(nombre,tipo,codigo_europeo) VALUES("3ro","Exactas",11);
INSERT INTO Ciclo(nombre,tipo,codigo_europeo) VALUES("46o","Exactas",12);
INSERT INTO Ciclo(nombre,tipo,codigo_europeo) VALUES("56o","Exactas",13);
INSERT INTO Ciclo(nombre,tipo,codigo_europeo) VALUES("3ro","Exactas",005);