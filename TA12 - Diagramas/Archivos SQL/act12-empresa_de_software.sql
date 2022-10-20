drop database if exists empresaSoftware;
create database empresaSoftware;

use empresaSoftware;

drop table if exists empresa;
create table empresa(
	codigo_empresa int not null auto_increment,
    CIF varchar(20),
    nombre varchar(50),
    direccion varchar(50),
    telefono int,
    primary key (codigo_empresa)
);

drop table if exists proyecto;
create table proyecto(
	codigo_proyecto int not null auto_increment,
	fecha_inicio date,
    fecha_final date,
    fecha_prevista date,
    codigo_empresa int not null,
    primary key (codigo_proyecto)
);

drop table if exists trabajador;
create table trabajador(
	codigo_trabajador int not null auto_increment,
	dni varchar(8),
    nombre varchar(20),
    apellidos varchar(50),
    primary key (codigo_trabajador)
);

drop table if exists profesion;
create table profesion(
	codigo_profesion int not null auto_increment,
    nombre varchar(20),
    codigo_trabajador int,
    primary key (codigo_profesion)
);

drop table if exists trabaja;
create table trabaja(
	codigo_proyecto int not null,
	codigo_profesion int not null,
    codigo_trabajador int not null,
    horas_trabajadas int,
    primary key (codigo_proyecto, codigo_profesion, codigo_trabajador)
);

alter table proyecto
add constraint FK_EmpresaProyecto
foreign key (codigo_empresa) references empresa(codigo_empresa)
on delete cascade on update cascade;

alter table profesion
add constraint FK_TrabajadorProfesion
foreign key (codigo_trabajador) references trabajador(codigo_trabajador)
on delete cascade on update cascade;

alter table trabaja
add constraint FK_TrabajadorTrabaja
foreign key (codigo_trabajador) references trabajador(codigo_trabajador)
on delete cascade on update cascade,
add constraint FK_ProfesionTrabaja
foreign key (codigo_profesion) references profesion(codigo_profesion)
on delete cascade on update cascade,
add constraint FK_ProyectoTrabaja
foreign key (codigo_proyecto) references proyecto(codigo_proyecto)
on delete cascade on update cascade;

-- INSERCION DE DATOS --

insert into trabajador (dni, nombre, apellidos) values
	("11111111", "Nombre1", "Apellido1"),
    ("22222222", "Nombre2", "Apellido2"),
    ("33333333", "Nombre3", "Apellido3"),
    ("44444444", "Nombre4", "Apellido4"),
    ("55555555", "Nombre5", "Apellido5"),
    ("66666666", "Nombre6", "Apellido6"),
    ("77777777", "Nombre7", "Apellido7"),
    ("88888888", "Nombre8", "Apellido8"),
    ("99999999", "Nombre9", "Apellido9"),
    ("12345678", "Nombre10", "Apellido10");
    
insert into profesion (nombre, codigo_trabajador) values
	("Nombre1", 1),
    ("Nombre2", 2),
    ("Nombre3", 3),
    ("Nombre4", 4),
    ("Nombre5", 5),
    ("Nombre6", 6),
    ("Nombre7", 7),
    ("Nombre8", 8),
    ("Nombre9", 9),
    ("Nombre10", 10);
    
insert into empresa (CIF, nombre, direccion, telefono) values
	("111", "Nombre1", "Direccion1", 666333999),
    ("222", "Nombre2", "Direccion2", 666333999),
    ("333", "Nombre3", "Direccion3", 666333999),
    ("444", "Nombre4", "Direccion4", 666333999),
    ("555", "Nombre5", "Direccion5", 666333999),
    ("666", "Nombre6", "Direccion6", 666333999),
    ("777", "Nombre7", "Direccion7", 666333999),
    ("888", "Nombre8", "Direccion8", 666333999),
    ("999", "Nombre9", "Direccion9", 666333999),
    ("151", "Nombre10", "Direccion10", 666333999);
    
insert into proyecto (fecha_inicio, fecha_final, fecha_prevista, codigo_empresa) values
	("2000-01-01", "2000-01-01", "2000-01-01", 1),
    ("2001-01-01", "2001-01-01", "2001-01-01", 2),
    ("2002-01-01", "2002-01-01", "2002-01-01", 3),
    ("2003-01-01", "2003-01-01", "2003-01-01", 4),
    ("2004-01-01", "2004-01-01", "2004-01-01", 5),
    ("2005-01-01", "2005-01-01", "2005-01-01", 6),
    ("2006-01-01", "2006-01-01", "2006-01-01", 7),
    ("2007-01-01", "2007-01-01", "2007-01-01", 8),
    ("2008-01-01", "2008-01-01", "2008-01-01", 9),
    ("2009-01-01", "2009-01-01", "2009-01-01", 10);
    
insert into trabaja (codigo_proyecto, codigo_profesion, codigo_trabajador, horas_trabajadas) values
	(1, 1, 1, 16),
    (1, 2, 1, 16),
    (1, 3, 2, 16),
    (1, 4, 2, 16),
    (1, 5, 3, 16),
    (1, 6, 3, 16),
    (1, 7, 4, 16),
    (1, 8, 4, 16),
    (1, 9, 4, 16),
    (1, 10, 5, 16);