drop database if exists organigrama;
create database organigrama;

use organigrama;

drop table if exists contrato;
create table contrato(
	id_contrato int not null auto_increment,
    fecha_inicio date,
    fecha_final date,
    categoria varchar(100),
    DNI varchar(8) not null,
    primary key (id_contrato)
);

drop table if exists nomina;
create table nomina(
	id_nomina int not null auto_increment,
    DNI varchar(8) not null,
    id_contrato int not null,
    fecha date,
    salario double,
    primary key (id_nomina, DNI, id_contrato)
);

drop table if exists empleado;
create table empleado(
	DNI varchar(8) not null,
    nSS int,
    codigo_trabajador int,
    nombre varchar(20),
    apellidos varchar(50),
    direccion varchar(50),
    telefono int,
    dni_responsable varchar(8),
    key(dni_responsable),
    primary key (DNI)
);

drop table if exists departamento;
create table departamento(
    codigo_departamento int not null auto_increment,
    nombre varchar(20),
    coordinador varchar(8),
    primary key (codigo_departamento)
);

alter table contrato
add constraint FK_EmpleadoContrato
foreign key (DNI) references empleado(DNI)
on delete cascade on update cascade;

alter table nomina
add constraint FK_EmpleadoNomina
foreign key (DNI) references empleado(DNI)
on delete cascade on update cascade,
add constraint FK_ContratoNomina
foreign key (id_contrato) references contrato(id_contrato)
on delete cascade on update cascade;

alter table empleado
add constraint FK_DNIResponsable
foreign key (dni_responsable) references empleado(DNI)
on delete cascade on update cascade;

alter table departamento
add constraint FK_EmpleadoDepartamento
foreign key (coordinador) references empleado(DNI)
on delete cascade on update cascade;

-- INSERCION DE DATOS --

insert into empleado (dni, nSS, codigo_trabajador, nombre, apellidos, direccion, telefono, dni_responsable) values
	("11111111", 100, 1, "Nombre1", "Apellido1", "Direccion1", 666333999, null),
    ("22222222", 200, 2, "Nombre2", "Apellido2", "Direccion2", 666333999, "11111111"),
    ("33333333", 300, 3, "Nombre3", "Apellido3", "Direccion3", 666333999, "11111111"),
    ("44444444", 400, 4, "Nombre4", "Apellido4", "Direccion4", 666333999, "11111111"),
    ("55555555", 500, 5, "Nombre5", "Apellido5", "Direccion5", 666333999, "11111111"),
    ("66666666", 600, 6, "Nombre6", "Apellido6", "Direccion6", 666333999, null),
    ("77777777", 700, 7, "Nombre7", "Apellido7", "Direccion7", 666333999, "66666666"),
    ("88888888", 800, 8, "Nombre8", "Apellido8", "Direccion8", 666333999, "66666666"),
    ("99999999", 900, 9, "Nombre9", "Apellido9", "Direccion9", 666333999, "66666666"),
    ("12345678", 101, 10, "Nombre10", "Apellido10", "Direccion10", 666333999, "66666666");

insert into departamento (nombre, coordinador) values
	("Nombre1", "11111111"),
    ("Nombre2", "22222222"),
    ("Nombre3", "33333333"),
    ("Nombre4", "44444444"),
    ("Nombre5", "55555555"),
    ("Nombre6", "66666666"),
    ("Nombre7", "77777777"),
    ("Nombre8", "88888888"),
    ("Nombre9", "99999999"),
    ("Nombre10", "12345678");

insert into contrato (fecha_inicio, fecha_final, categoria, dni) values
	("2001-01-01", "2011-01-01", "Categoria1", "11111111"),
    ("2002-01-01", "2012-01-01", "Categoria2", "22222222"),
    ("2003-01-01", "2013-01-01", "Categoria3", "33333333"),
    ("2004-01-01", "2014-01-01", "Categoria4", "44444444"),
    ("2005-01-01", "2015-01-01", "Categoria5", "55555555"),
    ("2006-01-01", "2016-01-01", "Categoria6", "66666666"),
    ("2007-01-01", "2017-01-01", "Categoria7", "77777777"),
    ("2008-01-01", "2018-01-01", "Categoria8", "88888888"),
    ("2009-01-01", "2019-01-01", "Categoria9", "99999999"),
    ("2010-01-01", "2020-01-01", "Categoria10", "12345678");
    
insert into nomina (dni, id_contrato, fecha, salario) values
	("11111111", 1, "2001-02-01", 2000),
    ("22222222", 2, "2002-02-01", 2000),
    ("33333333", 3, "2003-02-01", 2000),
    ("44444444", 4, "2004-02-01", 2000),
    ("55555555", 5, "2005-02-01", 2000),
    ("66666666", 6, "2006-02-01", 2000),
    ("77777777", 7, "2007-02-01", 2000),
    ("88888888", 8, "2008-02-01", 2000),
    ("99999999", 9, "2009-02-01", 2000),
    ("12345678", 10, "2010-02-01", 2000);
    