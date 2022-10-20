CREATE SCHEMA LigaFutbool_10_18;
USE LigaFutbool_10_18;
CREATE TABLE Equipo(
id_equipo SMALLINT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(20),
ciudad VARCHAR(30),
KEY (id_equipo)
);

CREATE TABLE Persona(
id_persona INT NOT NULL AUTO_INCREMENT,
id_equipo SMALLINT NOT NULL,
nombre VARCHAR(20),
apellido VARCHAR(20),
KEY (id_persona),
FOREIGN KEY (id_equipo) REFERENCES Equipo (id_equipo)
);

CREATE TABLE Partido(
id_partido INT NOT NULL AUTO_INCREMENT,
fecha DATE,
lugar VARCHAR(30),
KEY (id_partido)
);

CREATE TABLE EquipoPartido(
id_equipo_partido INT NOT NULL AUTO_INCREMENT,
id_partido INT NOT NULL,
id_equipo1 SMALLINT NOT NULL,
id_equipo2 SMALLINT NOT NULL,
goles_equipo1 SMALLINT DEFAULT 0,
goles_equipo2 SMALLINT DEFAULT 0,
KEY (id_equipo_partido),
FOREIGN KEY (id_partido) REFERENCES Partido (id_partido),
FOREIGN KEY (id_equipo1) REFERENCES Equipo (id_equipo),
FOREIGN KEY (id_equipo2) REFERENCES Equipo (id_equipo)
);

INSERT INTO Equipo(nombre,ciudad) VALUES("Barcelona","Barcelona");
INSERT INTO Equipo(nombre,ciudad) VALUES("Madrid","Madrid");
INSERT INTO Equipo(nombre,ciudad) VALUES("PSG","Paris");
INSERT INTO Equipo(nombre,ciudad) VALUES("Manchester City","Manchester");

INSERT INTO Persona(id_equipo,nombre,apellido) VALUES(1,"Lionel","Messi");
INSERT INTO Persona(id_equipo,nombre,apellido) VALUES(1,"Enrique","Zapata");
INSERT INTO Persona(id_equipo,nombre,apellido) VALUES(1,"Ibrahimobich","Zlatan");
INSERT INTO Persona(id_equipo,nombre,apellido) VALUES(1,"KUN","Aguero");
INSERT INTO Persona(id_equipo,nombre,apellido) VALUES(1,"Luis","Suarez");
INSERT INTO Persona(id_equipo,nombre,apellido) VALUES(2,"Kilian","Mbape");
INSERT INTO Persona(id_equipo,nombre,apellido) VALUES(2,"Cristiano","Ronaldo");
INSERT INTO Persona(id_equipo,nombre,apellido) VALUES(2,"Roberet","Lewandoski");
INSERT INTO Persona(id_equipo,nombre,apellido) VALUES(2,"Angel","Di Maria");
INSERT INTO Persona(id_equipo,nombre,apellido) VALUES(2,"Karim","Benzema");

INSERT INTO Partido(fecha,lugar) VALUES("2022-10-19","Barcelona");
INSERT INTO Partido(fecha,lugar) VALUES("2022-10-28","Madrid");

INSERT INTO EquipoPartido(id_partido,id_equipo1,id_equipo2,goles_equipo1,goles_equipo2) VALUES(1,1,2,3,0);
INSERT INTO EquipoPartido(id_partido,id_equipo1,id_equipo2,goles_equipo1,goles_equipo2) VALUES(2,2,1,0,4);
