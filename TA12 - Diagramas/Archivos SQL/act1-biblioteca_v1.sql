CREATE SCHEMA Libreria_1_18;

USE Libreria_1_18;

CREATE TABLE Libro(
id_libro INT NOT NULL AUTO_INCREMENT,
nombre_libro VARCHAR(200),
nombre_autor VARCHAR(200),
editorial VARCHAR(20) NOT NULL,
anio_creacion DATE,
anio_edicion DATE,
KEY (id_libro)
);

CREATE TABLE Volumen(
id_volumen INT NOT NULL AUTO_INCREMENT,
id_libro INT NOT NULL,
deterioro BOOLEAN ,
KEY (id_volumen),
FOREIGN KEY (id_libro) REFERENCES Libro (id_libro)
);

CREATE TABLE Cliente(
id_cliente INT NOT NULL AUTO_INCREMENT,
dni VARCHAR(8) NOT NULL,
n_socio INT NOT NULL,
nombre_apellido VARCHAR(200),
KEY (id_cliente),
telefono SMALLINT
);

CREATE TABLE Prestamo(
id_prestamo INT NOT NULL AUTO_INCREMENT,
id_cliente INT NOT NULL,
id_volumen INT NOT NULL,
fecha_inicio DATE NOT NULL,
fecha_real DATE,
KEY(id_prestamo),
FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente),
FOREIGN KEY (id_volumen) REFERENCES Volumen (id_volumen)
);

INSERT INTO Libro(nombre_libro,nombre_autor,editorial,anio_creacion,anio_edicion) VALUES("Tokio blues","Haruki Murakami","Tu librito","2019-03-25","2020-03-25");
INSERT INTO Libro(nombre_libro,nombre_autor,editorial,anio_creacion,anio_edicion) VALUES("Los versos satánicos","Salman Rushdie","libritos","2000-03-03","2001-03-03");
INSERT INTO Libro(nombre_libro,nombre_autor,editorial,anio_creacion,anio_edicion) VALUES("Crimen y castigo","Fiódor Dostoievski","Tugo","1992-07-25","1993-07-25");
INSERT INTO Libro(nombre_libro,nombre_autor,editorial,anio_creacion,anio_edicion) VALUES("Oliver Twist","Charles Dickens","tu librito","1900-05-09","1901-05-09");
INSERT INTO Libro(nombre_libro,nombre_autor,editorial,anio_creacion,anio_edicion) VALUES(" El extranjero ","Albert Camus","libritos","2008-11-24","2009-11-24");
INSERT INTO Libro(nombre_libro,nombre_autor,editorial,anio_creacion,anio_edicion) VALUES("La sombra del ciprés es alargada","Miguel Delibes","Tugo","2010-04-22","2011-04-22");
INSERT INTO Libro(nombre_libro,nombre_autor,editorial,anio_creacion,anio_edicion) VALUES("La flor púrpura","Chimamanda Ngozi Adichie","Tugo","2001-06-20","2002-06-20");
INSERT INTO Libro(nombre_libro,nombre_autor,editorial,anio_creacion,anio_edicion) VALUES("Cien años de soledad ","Gabriel García Márquez","libritos","2005-07-06","2006-07-06");
INSERT INTO Libro(nombre_libro,nombre_autor,editorial,anio_creacion,anio_edicion) VALUES("Rayuela ","Julio Cortázar","Tugo","1960-06-08","1961-06-08");
INSERT INTO Libro(nombre_libro,nombre_autor,editorial,anio_creacion,anio_edicion) VALUES("Matar a un ruiseñor","Harper Lee","Tu librito","1978-03-01","1979-03-01");


INSERT INTO Volumen(id_libro,deterioro) VALUES(1,true);
INSERT INTO Volumen(id_libro,deterioro) VALUES(1,false);
INSERT INTO Volumen(id_libro,deterioro) VALUES(3,true);
INSERT INTO Volumen(id_libro,deterioro) VALUES(3,false);
INSERT INTO Volumen(id_libro,deterioro) VALUES(2,true);
INSERT INTO Volumen(id_libro,deterioro) VALUES(2,true);
INSERT INTO Volumen(id_libro,deterioro) VALUES(2,true);
INSERT INTO Volumen(id_libro,deterioro) VALUES(8,true);
INSERT INTO Volumen(id_libro,deterioro) VALUES(8,true);
INSERT INTO Volumen(id_libro,deterioro) VALUES(9,false);


INSERT INTO Cliente(dni,nombre_apellido,n_socio) VALUES("23456789","Ramonel del Barco",54897);
INSERT INTO Cliente(dni,nombre_apellido,n_socio) VALUES("12345678","Juansito Perez",123489);
INSERT INTO Cliente(dni,nombre_apellido,n_socio) VALUES("34567891","Rosalva Loza",78946);
INSERT INTO Cliente(dni,nombre_apellido,n_socio) VALUES("45678912","Joqui Juarez",698254);
INSERT INTO Cliente(dni,nombre_apellido,n_socio) VALUES("56789123","Sofia Luna",693456);
INSERT INTO Cliente(dni,nombre_apellido,n_socio) VALUES("67891234","Joaquin Villalba",1204587);
INSERT INTO Cliente(dni,nombre_apellido,n_socio) VALUES("78912345","Marta Marita",032147);
INSERT INTO Cliente(dni,nombre_apellido,n_socio) VALUES("89123456","Julio Boca",698740);
INSERT INTO Cliente(dni,nombre_apellido,n_socio) VALUES("91234567","Nome Sale",12978);
INSERT INTO Cliente(dni,nombre_apellido,n_socio) VALUES("01234567","Yano SemeOcurre",103698);


INSERT INTO Prestamo(id_cliente,id_volumen,fecha_inicio,fecha_real) VALUES(1,1,"2010-10-19","2010-10-25");
INSERT INTO Prestamo(id_cliente,id_volumen,fecha_inicio,fecha_real) VALUES(2,2,"2010-10-19","2010-11-19");
INSERT INTO Prestamo(id_cliente,id_volumen,fecha_inicio,fecha_real) VALUES(3,3,"2010-11-10","2010-12-11");
INSERT INTO Prestamo(id_cliente,id_volumen,fecha_inicio,fecha_real) VALUES(4,4,"2010-04-10","2010-06-12");
INSERT INTO Prestamo(id_cliente,id_volumen,fecha_inicio,fecha_real) VALUES(1,5,"2010-07-10","2011-07-10");
INSERT INTO Prestamo(id_cliente,id_volumen,fecha_inicio,fecha_real) VALUES(1,6,"2010-04-10","2010-10-10");
INSERT INTO Prestamo(id_cliente,id_volumen,fecha_inicio,fecha_real) VALUES(5,7,"2010-02-10","2010-02-11");
INSERT INTO Prestamo(id_cliente,id_volumen,fecha_inicio,fecha_real) VALUES(6,8,"2010-12-10","2011-05-01");
INSERT INTO Prestamo(id_cliente,id_volumen,fecha_inicio,fecha_real) VALUES(7,9,"2010-06-10","2011-05-01");
INSERT INTO Prestamo(id_cliente,id_volumen,fecha_inicio,fecha_real) VALUES(8,10,"2010-09-10","2011-03-12");
