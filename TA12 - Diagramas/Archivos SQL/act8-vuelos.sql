drop database if exists vuelos;
create database vuelos;

use vuelos;

drop table if exists cliente;
create table cliente(
	id_cliente int not null auto_increment,
    dni varchar(8),
    nombre varchar(20),
    apellidos varchar(30),
    direccion varchar(50),
    telefono int,
    tarjetaCredito int,
    primary key (id_cliente)
);

drop table if exists avion;
create table avion(
	id_avion int not null auto_increment,
    num_plazas int,
    primary key (id_avion)
);

drop table if exists aeropuerto;
create table aeropuerto(
	id_aeropuerto int not null auto_increment,
    nombre varchar(50),
    localidad varchar(50),
    pais varchar(50),
    primary key (id_aeropuerto)
);

drop table if exists vuelo;
create table vuelo(
	id_vuelo int not null auto_increment,
    fecha_salida date,
    fecha_llegada date,
    aeropuerto_salida int not null,
    aeropuerto_llegada int not null,
    id_avion int not null,
    primary key (id_vuelo)
);

drop table if exists reserva;
create table reserva(
	id_reserva int not null auto_increment,
    num_plazas int,
    fecha date,
    id_cliente int not null,
    id_vuelo int not null,
    primary key (id_reserva)
);

drop table if exists tarjeta_embarque;
create table tarjeta_embarque(
	id_embarque int not null auto_increment,
    id_cliente int not null,
    id_avion int not null,
    primary key (id_embarque)
);

drop table if exists asiento;
create table asiento(
	fila int not null,
    columna int not null,
    planta int not null,
    id_embarque int not null,
    id_avion int not null,
    primary key (fila, columna, planta)
);

alter table vuelo
add constraint FK_AeropuertoVueloSalida
foreign key (aeropuerto_salida) references aeropuerto(id_aeropuerto)
on delete cascade on update cascade,
add constraint FK_AeropuertoVueloLlegada
foreign key (aeropuerto_llegada) references aeropuerto(id_aeropuerto)
on delete cascade on update cascade,
add constraint FK_AvionVuelo
foreign key (id_avion) references  avion(id_avion)
on delete cascade on update cascade;

alter table reserva
add constraint FK_ClienteReserva
foreign key (id_cliente) references cliente(id_cliente)
on delete cascade on update cascade,
add constraint FK_VueloReserva
foreign key (id_vuelo) references vuelo(id_vuelo)
on delete cascade on update cascade;

alter table tarjeta_embarque
add constraint FK_ClienteTarjeta
foreign key (id_cliente) references cliente(id_cliente)
on delete cascade on update cascade,
add constraint FK_AvionTarjeta
foreign key (id_avion) references  avion(id_avion)
on delete cascade on update cascade;

alter table asiento
add constraint FK_AvionAsiento
foreign key (id_avion) references avion(id_avion)
on delete cascade on update cascade,
add constraint FK_TarjetaAsiento
foreign key (id_embarque) references tarjeta_embarque(id_embarque)
on delete cascade on update cascade;

-- INSERCION DE DATOS --

insert into cliente (dni, nombre, apellidos, direccion, telefono, tarjetaCredito) values
	("11111111", "Nombre1", "Apellido1", "Direccion1", 666333999, 11111111),
    ("22222222", "Nombre2", "Apellido2", "Direccion2", 666333999, null),
    ("33333333", "Nombre3", "Apellido3", "Direccion3", 666333999, 33333333),
    ("44444444", "Nombre4", "Apellido4", "Direccion4", 666333999, null),
    ("55555555", "Nombre5", "Apellido5", "Direccion5", 666333999, 55555555),
    ("66666666", "Nombre6", "Apellido6", "Direccion6", 666333999, null),
    ("77777777", "Nombre7", "Apellido7", "Direccion7", 666333999, 77777777),
    ("88888888", "Nombre8", "Apellido8", "Direccion8", 666333999, 88888888),
    ("99999999", "Nombre9", "Apellido9", "Direccion9", 666333999, 99999999),
    ("12345678", "Nombre10", "Apellido10", "Direccion10", 666333999, null);
    
insert into avion (num_plazas) values
	(100),
    (110),
    (120),
    (130),
    (140),
    (150),
    (160),
    (170),
    (180),
    (190);
    
insert into aeropuerto (nombre, localidad, pais) values
	("Nombre1", "Localidad1", "Pais1"),
    ("Nombre2", "Localidad2", "Pais2"),
    ("Nombre3", "Localidad3", "Pais3"),
    ("Nombre4", "Localidad4", "Pais4"),
    ("Nombre5", "Localidad5", "Pais5"),
    ("Nombre6", "Localidad6", "Pais6"),
    ("Nombre7", "Localidad7", "Pais7"),
    ("Nombre8", "Localidad8", "Pais8"),
    ("Nombre9", "Localidad9", "Pais9"),
    ("Nombre10", "Localidad10", "Pais10");
    
insert into aeropuerto (nombre, localidad, pais) values
	("Nombre1", "Localidad1", "Pais1"),
    ("Nombre2", "Localidad2", "Pais2"),
    ("Nombre3", "Localidad3", "Pais3"),
    ("Nombre4", "Localidad4", "Pais4"),
    ("Nombre5", "Localidad5", "Pais5"),
    ("Nombre6", "Localidad6", "Pais6"),
    ("Nombre7", "Localidad7", "Pais7"),
    ("Nombre8", "Localidad8", "Pais8"),
    ("Nombre9", "Localidad9", "Pais9"),
    ("Nombre10", "Localidad10", "Pais10");
    
insert into vuelo (fecha_salida, fecha_llegada, aeropuerto_salida, aeropuerto_llegada, id_avion) values
	("2001-01-01", "2001-01-02", 1, 2, 1),
	("2001-01-01", "2001-01-02", 1, 2, 2),
	("2001-01-01", "2001-01-02", 1, 2, 3),
	("2001-01-01", "2001-01-02", 1, 2, 4),
	("2001-01-01", "2001-01-02", 1, 2, 5),
	("2001-01-01", "2001-01-02", 1, 2, 6),
	("2001-01-01", "2001-01-02", 1, 2, 7),
	("2001-01-01", "2001-01-02", 1, 2, 8),
	("2001-01-01", "2001-01-02", 1, 2, 9),
	("2001-01-01", "2001-01-02", 1, 2, 10);

insert into reserva (num_plazas, fecha, id_cliente, id_vuelo) values
	(1, "2001-01-01", 1, 1),
    (1, "2001-01-01", 2, 1),
    (1, "2001-01-01", 3, 1),
    (1, "2001-01-01", 4, 1),
    (1, "2001-01-01", 5, 1),
    (1, "2001-01-01", 6, 1),
    (1, "2001-01-01", 7, 1),
    (1, "2001-01-01", 8, 1),
    (1, "2001-01-01", 9, 1),
    (1, "2001-01-01", 10, 1);
    
insert into tarjeta_embarque (id_cliente, id_avion) values
	(1, 1),
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1),
    (6, 1),
    (7, 1),
    (8, 1),
    (9, 1),
    (10, 1);
    
insert into asiento (fila, columna, planta, id_embarque, id_avion) values
	(1, 1, 1, 1, 1),
    (2, 1, 1, 2, 1),
    (3, 1, 1, 3, 1),
    (4, 1, 1, 4, 1),
    (5, 1, 1, 5, 1),
    (6, 1, 1, 6, 1),
    (7, 1, 1, 7, 1),
    (8, 1, 1, 8, 1),
    (9, 1, 1, 9, 1),
    (10, 1, 1, 10, 1);