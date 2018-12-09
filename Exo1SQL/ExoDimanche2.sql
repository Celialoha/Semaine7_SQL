drop database CINEMA;
create database if not exists CINEMA;

use CINEMA;

create table ARTISTE
(Nom varchar(50),
Nation varchar(50),
Sexe varchar(10));

create table FILM
(Titre varchar(50),
Producteur varchar(50),
Realisateur varchar(50));

create table JOUE
(Titre varchar(50),
Acteur varchar(50));

create table SEANCE
(Numero int,
NomCine varchar(50),
Horaire int,
Titre varchar(50));

create table AVU
(Spectateur varchar(50),
Titre varchar(50));

create table AIME
(Spectateur varchar(50),
Titre varchar(50));

-- Contraintes d'intégrités fonctionnelles 1 --
ALTER TABLE ARTISTE ADD CONSTRAINT pk_artiste primary key ARTISTE(Nom);

-- 2 --
ALTER TABLE FILM ADD CONSTRAINT pk_film primary key FILM(Titre);

-- 3 --
ALTER TABLE JOUE ADD CONSTRAINT pk_joue primary key JOUE(Titre, Acteur);

-- 4 --
ALTER TABLE SEANCE ADD CONSTRAINT pk_seance primary key SEANCE(Numero, NomCine, Horaire);

-- 5 --
ALTER TABLE AVU ADD CONSTRAINT pk_avu primary key AVU(Spectateur, Titre);

-- 6 --
ALTER TABLE AIME ADD CONSTRAINT pk_aime primary key AIME(Spectateur, Titre);

-- Contraintes d'intégrités référentielles 1 --
alter table FILM add constraint fk_film_realise foreign key (Realisateur) references ARTISTE(Nom);

-- 2 --
alter table JOUE add constraint fk_joue_film foreign key (Titre) references FILM(Titre),
add constraint fk_joue_acteur foreign key (Acteur) references ARTISTE(Nom);


-- 3 --
alter table SEANCE add constraint fk_seance_titre foreign key(Titre) references FILM(Titre);

-- 4 --
alter table AVU add constraint fk_avu_film foreign key(Titre) references FILM(Titre);

-- 5 --
alter table AIME add constraint fk_aime_film foreign key(Titre) references FILM(Titre);

-- Contraintes de domaine 1 --
ALTER TABLE SEANCE 
ADD CONSTRAINT nb_salles 
  CHECK(Numero <= 10);

-- 2 --
ALTER TABLE SEANCE 
ADD CONSTRAINT heure_ouverture
  CHECK(Horaire >= 10);

-- Melody --
delimiter //
CREATE TRIGGER bef_insert_seance BEFORE INSERT
ON seance FOR EACH ROW   

IF EXISTS(SELECT * FROM seance WHERE NomCine = NEW.NomCine HAVING COUNT(*) = 10) 
then signal sqlstate '55557';
end if;


