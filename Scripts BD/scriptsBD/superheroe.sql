DROP DATABASE IF EXISTS superheroe;
CREATE DATABASE superheroe CHARACTER SET utf8mb4;
USE superheroe;

CREATE TABLE IF NOT EXISTS creador (
  id_creador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre VARCHAR(20) NOT NULL
);


CREATE TABLE personaje (
  id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre_real VARCHAR(20) NOT NULL,
  personaje VARCHAR(20) NOT NULL,
  inteligencia INT(10) NOT NULL,
  fuerza VARCHAR(10) NOT NULL,
  velocidad INT(11) NOT NULL,
  poder INT(11) NOT NULL,
  aparicion INT(11) NOT NULL,
  ocupacion VARCHAR(30) NULL,
  id_creador INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_creador) REFERENCES creador(id_creador)
);

-- Datos
INSERT INTO creador values (1,'Marvel');
INSERT INTO creador values (2,'DC COMICS');

INSERT INTO personaje values(1,'Bruce Banner','Hulk',160,'600 mil',75,98,1962,'Físico nuclear',1);
INSERT INTO personaje values(2,'Tony Stark','Iron Man',170,'200 mil',70,123,1963,'Inventor Industrial',1);
INSERT INTO personaje values(3,'Clarc Kent','Superman',170,'infinita',130,142,1948,'Reportero',2);
INSERT INTO personaje values(4,'Barry Allen','Flash',100,'infinita',150,142,1948,'Cientifico Forense',2);
