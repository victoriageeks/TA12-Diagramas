CREATE SCHEMA Libreria_6_18;
USE Libreria_6_18;
CREATE TABLE Persona(
id_persona INT NOT NULL AUTO_INCREMENT,
nombre_apellido VARCHAR(200),
KEY (id_persona)
);

CREATE TABLE Cliente(
id_persona INT NOT NULL,
n_socio INT NOT NULL,
telefono INT,
FOREIGN KEY (id_persona) REFERENCES Persona (id_persona)
);

CREATE TABLE Autor(
id_persona INT NOT NULL,
pais VARCHAR(20),
FOREIGN KEY (id_persona) REFERENCES Persona (id_persona)
);

CREATE TABLE Articulo(
id_articulo INT NOT NULL AUTO_INCREMENT,
titulo VARCHAR(20),
anio_creacion DATE,
id_autor INT NOT NULL,
resumen VARCHAR(200),
cantidad INT,
tipo VARCHAR(2),
KEY (id_articulo),
FOREIGN KEY (id_autor) REFERENCES Autor (id_persona)
);

CREATE TABLE Prestamo(
id_prestamo INT NOT NULL AUTO_INCREMENT,
id_cliente INT NOT NULL,
id_copia INT NOT NULL,
fecha_inicio DATE,
fecha_real DATE,
KEY (id_prestamo),
FOREIGN KEY (id_copia) REFERENCES Articulo (id_articulo),
FOREIGN KEY (id_cliente) REFERENCES Cliente (id_persona)
);

INSERT INTO Persona(nombre_apellido) VALUES("Ramonel del Barco");
INSERT INTO Persona(nombre_apellido) VALUES("Juansito Perez");
INSERT INTO Persona(nombre_apellido) VALUES("Rosalva Loza");
INSERT INTO Persona(nombre_apellido) VALUES("Joqui Juarez");
INSERT INTO Persona(nombre_apellido) VALUES("Sofia Luna");
INSERT INTO Persona(nombre_apellido) VALUES("Joaquin Villalba");
INSERT INTO Persona(nombre_apellido) VALUES("Marta Marita");
INSERT INTO Persona(nombre_apellido) VALUES("Julio Boca");
INSERT INTO Persona(nombre_apellido) VALUES("Nome Sale");
INSERT INTO Persona(nombre_apellido) VALUES("Yano SemeOcurre");
INSERT INTO Persona(nombre_apellido) VALUES("Alvaro Bernabey");
INSERT INTO Persona(nombre_apellido) VALUES("Victoria Araundo");
INSERT INTO Persona(nombre_apellido) VALUES("Jaume Rodriguez");

INSERT INTO Cliente(id_persona,n_socio,telefono) VALUES(11,456789,602509473);
INSERT INTO Cliente(id_persona,n_socio,telefono) VALUES(12,45781,602509472);
INSERT INTO Cliente(id_persona,n_socio,telefono) VALUES(13,78124,602509471);

INSERT INTO Autor(id_persona,pais) VALUES(1,"Argentina");
INSERT INTO Autor(id_persona,pais) VALUES(2,"España");
INSERT INTO Autor(id_persona,pais) VALUES(3,"Francia");
INSERT INTO Autor(id_persona,pais) VALUES(4,"Portugal");
INSERT INTO Autor(id_persona,pais) VALUES(5,"Brazil");
INSERT INTO Autor(id_persona,pais) VALUES(6,"Estados Unidos");
INSERT INTO Autor(id_persona,pais) VALUES(7,"Inglaterra");
INSERT INTO Autor(id_persona,pais) VALUES(8,"Alemania");
INSERT INTO Autor(id_persona,pais) VALUES(9,"China");
INSERT INTO Autor(id_persona,pais) VALUES(11,"Mexico");

INSERT INTO Articulo(titulo,id_autor,resumen,anio_creacion,cantidad,tipo) VALUES("Tokio blues",1,"Emonocionante Historia en tokio medieval","2019-03-25",130,"PL");
INSERT INTO Articulo(titulo,id_autor,resumen,anio_creacion,cantidad,tipo)  VALUES("Los versos satánicos",2,"Suspenso y Miedo con un demonio a sueldo","2000-03-03",120,"PL");
INSERT INTO Articulo(titulo,id_autor,resumen,anio_creacion,cantidad,tipo)  VALUES("Crimen y castigo",3,"El ultimo disco de Maluma","2022-07-25",5,"CD");
INSERT INTO Articulo(titulo,id_autor,resumen,anio_creacion,cantidad,tipo)  VALUES("Oliver Twist",4,"El relanzamiento del clasico","1900-05-09",10,"CD");
INSERT INTO Articulo(titulo,id_autor,resumen,anio_creacion,cantidad,tipo)  VALUES("El extranjero ",5,"Historia de un extranjero perdido en china","2008-11-24",754,"LB");
INSERT INTO Articulo(titulo,id_autor,resumen,anio_creacion,cantidad,tipo)  VALUES("La sombra del cipres",6,"Un misterio con suspenso y accion","2010-04-22",400,"LB");
INSERT INTO Articulo(titulo,id_autor,resumen,anio_creacion,cantidad,tipo)  VALUES("La flor púrpura",7,"Drama tragico y fuerte basada en el medio evo","2001-06-20",140,"PL");
INSERT INTO Articulo(titulo,id_autor,resumen,anio_creacion,cantidad,tipo)  VALUES("Cien dias de soledad ",8,"historia tragica basada en una historia real","2005-07-06",470,"LB");
INSERT INTO Articulo(titulo,id_autor,resumen,anio_creacion,cantidad,tipo)  VALUES("Rayuela ",9,"Clasico Latino","1960-06-08",270,"LB");


INSERT INTO Prestamo(id_cliente,id_copia,fecha_inicio,fecha_real) VALUES(11,1,"2010-10-19","2010-10-25");
INSERT INTO Prestamo(id_cliente,id_copia,fecha_inicio,fecha_real) VALUES(12,2,"2010-10-19","2010-11-19");
INSERT INTO Prestamo(id_cliente,id_copia,fecha_inicio,fecha_real) VALUES(13,3,"2010-11-10","2010-12-11");
INSERT INTO Prestamo(id_cliente,id_copia,fecha_inicio,fecha_real) VALUES(11,4,"2010-04-10","2010-06-12");
INSERT INTO Prestamo(id_cliente,id_copia,fecha_inicio,fecha_real) VALUES(12,5,"2010-07-10","2011-07-10");
INSERT INTO Prestamo(id_cliente,id_copia,fecha_inicio,fecha_real) VALUES(13,6,"2010-04-10","2010-10-10");
INSERT INTO Prestamo(id_cliente,id_copia,fecha_inicio,fecha_real) VALUES(11,7,"2010-02-10","2010-02-11");
INSERT INTO Prestamo(id_cliente,id_copia,fecha_inicio,fecha_real) VALUES(12,8,"2010-12-10","2011-05-01");
INSERT INTO Prestamo(id_cliente,id_copia,fecha_inicio,fecha_real) VALUES(13,9,"2010-06-10","2011-05-01");

