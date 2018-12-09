CREATE DATABASE IF NOT EXISTS encore_du_cinema;
USE encore_du_cinema;

-- Création des tables 

CREATE TABLE film (
id_film MEDIUMINT(9) NOT NULL,
titre VARCHAR (50) NOT NULL,
metteur_en_scene VARCHAR(50),
acteur VARCHAR(50),
CONSTRAINT id_film PRIMARY KEY(id_film),
KEY `titre_idx` (`titre`)
);

CREATE TABLE salle (
id_salle MEDIUMINT(9) NOT NULL,
nom_cine VARCHAR(50) NOT NULL,
adresse VARCHAR(50),
telephone VARCHAR(15),
CONSTRAINT pk_id_salle PRIMARY KEY(id_salle),
KEY `nom_cine_idx` (`nom_cine`)
);

CREATE TABLE programme (
id_programme MEDIUMINT(9) NOT NULL,
nom_cine VARCHAR(50) NOT NULL,
titre VARCHAR(50) NOT NULL,
horaire TIME, 
CONSTRAINT pk_id_programme PRIMARY KEY(id_programme),
KEY `fk_programme_nom_cine_idx` (`nom_cine`),
KEY `fk_programme_titre_idx` (`titre`),
CONSTRAINT fk_programme_nom_cine FOREIGN KEY(nom_cine) REFERENCES salle (nom_cine),
CONSTRAINT fk_programme_titre FOREIGN KEY(titre) REFERENCES film (titre)
);

-- Importation des données

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/film.csv' 
INTO TABLE film
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/salle.csv' 
INTO TABLE salle
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/programme.csv' 
INTO TABLE programme
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;