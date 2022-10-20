CREATE DATABASE red_social;
USE red_social;

CREATE TABLE usuarios(
id INT PRIMARY KEY AUTO_INCREMENT,
contrasenia VARCHAR(20),
nombre VARCHAR(20),
apellidos VARCHAR(60),
foto VARCHAR(255)
);

CREATE TABLE usuario_normal(
id INT,
email VARCHAR(50),
direccion VARCHAR(70),
telefono INT,
FOREIGN KEY(id) REFERENCES usuarios(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE contacto(
id_contacto INT PRIMARY KEY AUTO_INCREMENT,
descripcion VARCHAR(100),
id INT,
FOREIGN KEY(id) REFERENCES usuarios(id)
ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE comentarios(
id_comentario INT PRIMARY KEY AUTO_INCREMENT,
texo VARCHAR(255),
imagen VARCHAR(255),
id INT,
FOREIGN KEY(id) REFERENCES usuarios(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE grupo(
id_grupo INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(60),
descripcion VARCHAR(255)
);

CREATE TABLE organizacion_grupo(
id_grupo INT,
id INT,
FOREIGN KEY(id_grupo) REFERENCES grupo(id_grupo)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id) REFERENCES usuarios(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE forma_grupo(
id_grupo INT,
id INT,
id_contacto INT,
FOREIGN KEY(id_grupo) REFERENCES grupo(id_grupo)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id) REFERENCES usuarios(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_contacto) REFERENCES contacto(id_contacto)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE visible_comentario(
id_comentario INT,
id_contacto INT,
id_grupo INT,
FOREIGN KEY(id_comentario) REFERENCES comentarios(id_comentario)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_contacto) REFERENCES contacto(id_contacto)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_grupo) REFERENCES grupo(id_grupo)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE escribe_comentario(
id INT,
id_comentario INT,
FOREIGN KEY(id) REFERENCES usuarios(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY(id_comentario) REFERENCES comentarios(id_comentario)
ON DELETE CASCADE ON UPDATE CASCADE
);

USE red_social;
INSERT INTO usuarios(contrasenia,nombre,apellidos,foto) VALUES
('contrasenia1','nombre1','apellidos1','foto1'),
('contrasenia2','nombre2','apellidos2','foto2'),
('contrasenia3','nombre3','apellidos3','foto3'),
('contrasenia4','nombre4','apellidos4','foto4'),
('contrasenia5','nombre5','apellidos5','foto5'),
('contrasenia6','nombre6','apellidos6','foto6'),
('contrasenia7','nombre7','apellidos7','foto7'),
('contrasenia8','nombre8','apellidos8','foto8'),
('contrasenia9','nombre9','apellidos9','foto9'),
('contrasenia10','nombre10','apellidos10','foto10');

INSERT INTO contacto(descripcion,id) VALUES
('descripcion1',1),
('descripcion2',2),
('descripcion3',3),
('descripcion4',4),
('descripcion5',5),
('descripcion6',6),
('descripcion7',7),
('descripcion8',8),
('descripcion9',9),
('descripcion10',10);

INSERT INTO comentarios(texo,imagen,id) VALUES
('texto1','img1',1),
('texto2','img2',2),
('texto3','img3',3),
('texto4','img4',4),
('texto5','img5',5),
('texto6','img6',6),
('texto7','img7',7),
('texto8','img8',8),
('texto9','img9',9),
('texto10','img10',10);

INSERT INTO grupo(nombre, descripcion) VALUES
('nombre1','descripcion1'),
('nombre2','descripcion2'),
('nombre3','descripcion3'),
('nombre4','descripcion4'),
('nombre5','descripcion5'),
('nombre6','descripcion6'),
('nombre7','descripcion7'),
('nombre8','descripcion8'),
('nombre9','descripcion9'),
('nombre10','descripcion10');

INSERT INTO organizacion_grupo(id_grupo,id) VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5),
(6,6),
(7,7),
(8,8),
(9,9),
(10,10);

INSERT INTO forma_grupo(id_grupo,id,id_contacto) VALUES
(1,9,1),
(2,8,2),
(3,7,3),
(4,6,4),
(5,5,5),
(6,4,6),
(7,3,7),
(8,2,8),
(9,1,9),
(10,10,10);

INSERT INTO visible_comentario(id_comentario,id_contacto,id_grupo) VALUES
(1,9,1),
(2,8,2),
(3,7,3),
(4,6,4),
(5,5,5),
(6,4,6),
(7,3,7),
(8,2,8),
(9,1,9),
(10,10,10);

INSERT INTO escribe_comentario(id,id_comentario) VALUES
(1,9),
(2,8),
(3,7),
(4,6),
(5,10),
(6,5),
(7,4),
(8,3),
(9,2),
(10,1);



