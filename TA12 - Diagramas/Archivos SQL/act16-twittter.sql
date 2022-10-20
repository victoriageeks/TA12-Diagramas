drop database if exists twitter;
create database twitter;

use twitter;

drop table if exists usuario;
create table usuario(
	nombre_usuario varchar(20) not null,
    contrasena varchar(20) not null,
    nombre varchar(20),
    foto_perfil varchar(100),
    primary key (nombre_usuario, contrasena)
);

drop table if exists seguidores;
create table seguidores(
	nombre_usuario_seguido varchar(20) not null,
    nombre_usuario_seguidor varchar(20) not null,
    primary key (nombre_usuario_seguido, nombre_usuario_seguidor)
);

drop table if exists mensajes;
create table mensajes(
	nombre_usuario_remitente varchar(20) not null,
    nombre_usuario_destino varchar(20) not null,
    contenido varchar(255),
    primary key (nombre_usuario_remitente, nombre_usuario_destino)
);

drop table if exists bloqueados;
create table bloqueados(
	nombre_usuario_bloqueador varchar(20) not null,
    nombre_usuario_bloqueado varchar(20) not null,
    primary key (nombre_usuario_bloqueador, nombre_usuario_bloqueado)
);

drop table if exists tuit;
create table tuit(
	id_tuit int not null auto_increment,
	nombre_usuario varchar(20) not null,
    contenido varchar(255),
    retuits int,
    favoritos int,
    respuestas int,
    id_tuit_respuesta int,
    primary key (id_tuit, nombre_usuario)
);

drop table if exists retuits;
create table retuits(
	id_tuit int not null auto_increment,
	nombre_usuario varchar(20) not null,
    fecha date,
    primary key (id_tuit, nombre_usuario)
);

drop table if exists favoritos;
create table favoritos(
	id_tuit int not null auto_increment,
	nombre_usuario varchar(20) not null,
    fecha date,
    primary key (id_tuit, nombre_usuario)
);

alter table seguidores
add constraint FK_SeguidoSeguidores
foreign key (nombre_usuario_seguido) references usuario(nombre_usuario)
on delete cascade on update cascade,
add constraint FK_SeguidorSeguidores
foreign key (nombre_usuario_seguidor) references usuario(nombre_usuario)
on delete cascade on update cascade;

alter table mensajes
add constraint FK_RemitenteMensajes
foreign key (nombre_usuario_remitente) references usuario(nombre_usuario)
on delete cascade on update cascade,
add constraint FK_DestinoMensajes
foreign key (nombre_usuario_destino) references usuario(nombre_usuario)
on delete cascade on update cascade;

alter table bloqueados
add constraint FK_BloqueadorBloqueados
foreign key (nombre_usuario_bloqueador) references usuario(nombre_usuario)
on delete cascade on update cascade,
add constraint FK_BloqueadoBloqueados
foreign key (nombre_usuario_bloqueado) references usuario(nombre_usuario)
on delete cascade on update cascade;

alter table tuit
add constraint FK_UsuarioTuit
foreign key (nombre_usuario) references usuario(nombre_usuario)
on delete cascade on update cascade,
add constraint FK_RespuestaTuit
foreign key (id_tuit_respuesta) references tuit(id_tuit)
on delete cascade on update cascade;

alter table retuits
add constraint FK_UsuarioRetuits
foreign key (nombre_usuario) references usuario(nombre_usuario)
on delete cascade on update cascade,
add constraint FK_TuitRetuits
foreign key (id_tuit) references tuit(id_tuit)
on delete cascade on update cascade;

alter table favoritos
add constraint FK_UsuarioFavoritos
foreign key (nombre_usuario) references usuario(nombre_usuario)
on delete cascade on update cascade,
add constraint FK_TuitFavoritos
foreign key (id_tuit) references tuit(id_tuit)
on delete cascade on update cascade;

-- INSERCION DE DATOS --

insert into usuario (nombre_usuario, contrasena, nombre, foto_perfil) values
	("Usuario1", "Password1", "Nombre1", "Foto1"),
    ("Usuario2", "Password2", "Nombre2", "Foto2"),
    ("Usuario3", "Password3", "Nombre3", "Foto3"),
    ("Usuario4", "Password4", "Nombre4", "Foto4"),
    ("Usuario5", "Password5", "Nombre5", "Foto5"),
    ("Usuario6", "Password6", "Nombre6", "Foto6"),
    ("Usuario7", "Password7", "Nombre7", "Foto7"),
    ("Usuario8", "Password8", "Nombre8", "Foto8"),
    ("Usuario9", "Password9", "Nombre9", "Foto9"),
    ("Usuario10", "Password10", "Nombre10", "Foto10");
    
insert into tuit (nombre_usuario, contenido, retuits, favoritos, respuestas, id_tuit_respuesta) values
	("Usuario1", "C1", 0,0,0, null),
    ("Usuario2", "C1", 0,0,0, null),
    ("Usuario3", "C1", 0,0,0, null),
    ("Usuario4", "C1", 0,0,0, null),
    ("Usuario5", "C1", 0,0,0, null),
    ("Usuario6", "C1", 0,0,0, null),
    ("Usuario7", "C1", 0,0,0, null),
    ("Usuario8", "C1", 0,0,0, null),
    ("Usuario9", "C1", 0,0,0, null),
    ("Usuario10", "C1", 0,0,0, null);
    
insert into retuits (nombre_usuario, id_tuit, fecha) values
	("Usuario1", 1, "2010-01-01"),
    ("Usuario2", 2, "2010-01-01"),
    ("Usuario3", 3, "2010-01-01"),
    ("Usuario4", 4, "2010-01-01"),
    ("Usuario5", 5, "2010-01-01"),
    ("Usuario6", 6, "2010-01-01"),
    ("Usuario7", 7, "2010-01-01"),
    ("Usuario8", 8, "2010-01-01"),
    ("Usuario9", 9, "2010-01-01"),
    ("Usuario10", 10, "2010-01-01");

insert into favoritos (nombre_usuario, id_tuit, fecha) values
	("Usuario1", 1, "2010-01-01"),
    ("Usuario2", 2, "2010-01-01"),
    ("Usuario3", 3, "2010-01-01"),
    ("Usuario4", 4, "2010-01-01"),
    ("Usuario5", 5, "2010-01-01"),
    ("Usuario6", 6, "2010-01-01"),
    ("Usuario7", 7, "2010-01-01"),
    ("Usuario8", 8, "2010-01-01"),
    ("Usuario9", 9, "2010-01-01"),
    ("Usuario10", 10, "2010-01-01");
    
insert into seguidores(nombre_usuario_seguido, nombre_usuario_seguidor) values
	("Usuario1", "Usuario2"),
    ("Usuario2", "Usuario2"),
    ("Usuario3", "Usuario2"),
    ("Usuario4", "Usuario1"),
    ("Usuario5", "Usuario1"),
    ("Usuario6", "Usuario1"),
    ("Usuario7", "Usuario4"),
    ("Usuario8", "Usuario4"),
    ("Usuario9", "Usuario4"),
    ("Usuario10", "Usuario4");
    
insert into mensajes(nombre_usuario_remitente, nombre_usuario_destino, contenido) values
	("Usuario1", "Usuario2", "C2"),
    ("Usuario2", "Usuario2", "C2"),
    ("Usuario3", "Usuario2", "C2"),
    ("Usuario4", "Usuario1", "C2"),
    ("Usuario5", "Usuario1", "C2"),
    ("Usuario6", "Usuario1", "C2"),
    ("Usuario7", "Usuario4", "C2"),
    ("Usuario8", "Usuario4", "C2"),
    ("Usuario9", "Usuario4", "C2"),
    ("Usuario10", "Usuario4", "C2");
    
insert into bloqueados(nombre_usuario_bloqueador, nombre_usuario_bloqueado) values
	("Usuario1", "Usuario9"),
    ("Usuario2", "Usuario9"),
    ("Usuario3", "Usuario9"),
    ("Usuario4", "Usuario9"),
    ("Usuario5", "Usuario9"),
    ("Usuario6", "Usuario9"),
    ("Usuario7", "Usuario9"),
    ("Usuario8", "Usuario9"),
    ("Usuario9", "Usuario10"),
    ("Usuario10", "Usuario9");