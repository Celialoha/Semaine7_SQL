-- Exercice 4 --

drop database SPECTACLES;
create database if not exists SPECTACLES;

use SPECTACLES;

create table SALLES
(ID_Salles int auto_increment,
Salle varchar(10),
NombrePlaces int,
index Idx_Salle (Salle),
constraint pk_ID_Salle primary key (ID_Salles, Salle)
 );

create table SPECTACLES
(ID_Spectacles int auto_increment,
Titre varchar(100),
Semaine int,
Salle varchar(10),
index Idx_Titre (Titre),
constraint pk_ID_Titre primary key (ID_Spectacles, Titre),
constraint FK_Salle foreign key (Salle) references SALLES(Salle));

create table INTERVENANTS
(ID_Intervenants int auto_increment,
Titre varchar(100),
Intervenant varchar(50),
Type varchar(100),
constraint pk_ID_Intervenants primary key (ID_Intervenants, Intervenant),
constraint FK_Titre foreign key (Titre) references SPECTACLES(Titre));

create table PLACES
(ID_Place int auto_increment,
Salle varchar(10),
Semaine int,
Jour varchar(20) default null,
Disponibilite int default 0,
constraint pk_ID_Paces primary key (ID_Place, Salle),
constraint FK_Salle_Places foreign key (Salle) references SALLES(Salle));


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Spectacles/BD_SALLES.csv' 
INTO TABLE SALLES
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Salle, NombrePlaces);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Spectacles/BD_SPECTACLES.csv' 
INTO TABLE SPECTACLES
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Titre, Semaine, Salle);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Spectacles/BD_INTERVENANTS.csv' 
INTO TABLE INTERVENANTS
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Titre, Intervenant, Type);


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Spectacles/BD_PLACES2.csv' 
INTO TABLE PLACES
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Semaine, Salle, Jour, Disponibilite);
