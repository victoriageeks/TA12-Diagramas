drop database if exists geografia;
create database geografia;

use geografia;

drop table if exists localidad;
create table localidad(
	id_localidad int not null auto_increment,
    nombre varchar(100),
    poblacion int,
    id_provincia int,
    primary key (id_localidad)
);

drop table if exists provincia;
create table provincia(
	id_provincia int not null auto_increment,
    nombre varchar(100),
    poblacion int,
    superficie double,
    id_capital int,
    id_comunidad int,
    primary key (id_provincia)
);

drop table if exists comunidadAutonoma;
create table comunidadAutonoma(
	id_comunidad int not null auto_increment,
    nombre varchar(100),
    poblacion int,
    superficie double,
    id_capital int,
    primary key (id_comunidad)
);

alter table localidad
add constraint FK_ProvinciaLocalidad
foreign key (id_provincia) references provincia(id_provincia)
on delete cascade on update cascade;

alter table provincia
add constraint FK_LocalidadProvincia
foreign key (id_capital) references localidad(id_localidad)
on delete cascade on update cascade,
add constraint FK_ComunidadProvincia
foreign key (id_comunidad) references  comunidadAutonoma(id_comunidad)
on delete cascade on update cascade;

alter table comunidadAutonoma
add constraint FK_LocalidadComunidad
foreign key (id_capital) references localidad(id_localidad)
on delete cascade on update cascade;

-- INSERCION DE DATOS --

insert into localidad (nombre, poblacion) values
	("Local1", 100),
    ("Local2", 200),
    ("Local3", 300),
    ("Local4", 400),
    ("Local5", 500),
    ("Local6", 600),
    ("Local7", 700),
    ("Local8", 800),
    ("Local9", 900),
    ("Local10", 1000);
    
    insert into provincia (nombre, poblacion, superficie) values
	("Provincia1", 1000, 100.0),
    ("Provincia2", 2000, 200.0),
    ("Provincia3", 3000, 300.0),
    ("Provincia4", 4000, 400.0),
    ("Provincia5", 5000, 500.0),
    ("Provincia6", 6000, 600.0),
    ("Provincia7", 7000, 700.0),
    ("Provincia8", 8000, 800.0),
    ("Provincia9", 9000, 900.0),
    ("Provincia10", 10000, 1000.0);
    
    insert into comunidadAutonoma (nombre, poblacion, superficie) values
	("Comunidad1", 1500, 150.0),
    ("Comunidad2", 2500, 250.0),
    ("Comunidad3", 3500, 350.0),
    ("Comunidad4", 4500, 450.0),
    ("Comunidad5", 5500, 550.0),
    ("Comunidad6", 6500, 650.0),
    ("Comunidad7", 7500, 750.0),
    ("Comunidad8", 8500, 850.0),
    ("Comunidad9", 9500, 950.0),
    ("Comunidad10", 10500, 1050.0);
    