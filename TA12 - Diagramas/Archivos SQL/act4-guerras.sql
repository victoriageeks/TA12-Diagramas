drop database if exists guerras;
create database guerras;

use guerras;

drop table if exists guerra;
create table guerra(
	id_guerra int not null auto_increment,
    nombre varchar(100),
    ano_inicio int,
    ano_fin int,
    primary key (id_guerra)
);

drop table if exists participa;
create table participa(
	id_guerra int not null,
    id_bando int not null,
    ganador int,
    primary key (id_guerra, id_bando)
);

drop table if exists bando;
create table bando(
    id_bando int not null auto_increment,
    fecha_union date,
    fecha_abandono date,
    id_pais int not null,
    primary key (id_bando)
);

drop table if exists pais;
create table pais(
    id_pais int not null auto_increment,
    nombre varchar(100),
    primary key (id_pais)
);

drop table if exists independencia;
create table independencia(
	id_independencia int not null auto_increment,
    id_pais int not null,
    fecha_inicial date,
    fecha_final date,
    primary key (id_independencia, id_pais)
);

alter table participa
add constraint FK_GuerraParticipa
foreign key (id_guerra) references guerra(id_guerra)
on delete cascade on update cascade,
add constraint FK_BandoParticipa
foreign key (id_bando) references  bando(id_bando)
on delete cascade on update cascade;

alter table bando
add constraint FK_PaisBando
foreign key (id_pais) references  pais(id_pais)
on delete cascade on update cascade;

alter table independencia
add constraint FK_PaisIndependencia
foreign key (id_pais) references  pais(id_pais)
on delete cascade on update cascade;

-- INSERCION DE DATOS --

insert into guerra (nombre, ano_inicio, ano_fin) values
	("Guerra1", 1910, 1915),
    ("Guerra2", 1920, 1925),
    ("Guerra3", 1930, 1935),
    ("Guerra4", 1940, 1945),
    ("Guerra5", 1950, 1955),
    ("Guerra6", 1960, 1965),
    ("Guerra7", 1970, 1975),
    ("Guerra8", 1980, 1985),
    ("Guerra9", 1990, 1995),
    ("Guerra10", 2000, 2005);
    
insert into pais (nombre) values
	("Pais1"),
    ("Pais2"),
    ("Pais3"),
    ("Pais4"),
    ("Pais5"),
    ("Pais6"),
    ("Pais7"),
    ("Pais8"),
    ("Pais9"),
    ("Pais10");

insert into bando (id_pais, fecha_union, fecha_abandono) values
	(1, "1910-01-01", null),
    (2, "1920-02-01", null),
    (3, "1930-03-01", "1933-12-04"),
    (4, "1940-04-01", null),
    (5, "1950-05-01", null),
    (6, "1960-06-01", "1962-08-12"),
    (7, "1970-07-01", "1971-11-23"),
    (8, "1980-08-01", null),
    (9, "1990-09-01", null),
    (10, "2000-10-01", null);
    
insert into participa (id_guerra, id_bando, ganador) values
	(1, 1, 1),
    (2, 2, 2),
    (3, 3, 2),
    (4, 4, 1),
    (5, 5, 1),
    (6, 6, 2),
    (7, 7, 1),
    (8, 8, 2),
    (9, 9, 2),
    (10, 10, 1);
    
insert into independencia (id_pais, fecha_inicial, fecha_final) values
	(1, "1811-01-01", null),
    (2, "1812-01-01", null),
    (3, "1813-01-01", "2006-10-23"),
    (4, "1814-01-01", null),
    (5, "1815-01-01", null),
    (6, "1816-01-01", null),
    (7, "1817-01-01", null),
    (8, "1818-01-01", "1990-04-26"),
    (9, "1819-01-01", null),
    (10, "1820-01-01", null);