-- Exercice 5 --

DROP DATABASE Boissons;
CREATE DATABASE IF NOT EXISTS Boissons;
USE Boissons;

CREATE TABLE IF NOT EXISTS frequente (
  personne VARCHAR(50),
  bar VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS sert (
  bar VARCHAR(50),
  biere VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS aime (
  personne VARCHAR(50),
  biere VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS vente (
  bar VARCHAR(50),
  biere VARCHAR(50),
  montant INT
);

INSERT INTO aime VALUES ('michel','levrette');
INSERT INTO aime VALUES ('bernard','kro');
INSERT INTO aime VALUES ('benjamin','heineken');
INSERT INTO aime VALUES ('benjamin','kro');
INSERT INTO aime VALUES ('thomas','heineken');
INSERT INTO aime VALUES ('Charles Dupont','royal club');

INSERT INTO frequente VALUES('michel','baraka');
INSERT INTO frequente VALUES('michel','barbote');
INSERT INTO frequente VALUES('thomas','au rendez vous');
INSERT INTO frequente VALUES('benjamin','vnb');
INSERT INTO frequente VALUES('Charles Dupont','cafe de la gare');

INSERT INTO sert VALUES ('baraka','heineken');
INSERT INTO sert VALUES ('baraka','kro');
INSERT INTO sert VALUES ('baraka','levrette');
INSERT INTO sert VALUES ('baraka','royal club');
INSERT INTO sert VALUES ('barbote','levrette');
INSERT INTO sert VALUES ('au rendez vous','royal club');
INSERT INTO sert VALUES ('vnb','kro');
INSERT INTO sert VALUES ('vnb','heineken');
INSERT INTO sert VALUES ('cafe de la gare','royal club');

INSERT INTO vente VALUES ('baraka','heineken',2);
INSERT INTO vente VALUES ('baraka','kro',1);
INSERT INTO vente VALUES ('baraka','levrette',4);
INSERT INTO vente VALUES ('baraka','royal club',8);
INSERT INTO vente VALUES ('barbote','levrette',5);
INSERT INTO vente VALUES ('au rendez vous','royal club',8);
INSERT INTO vente VALUES ('vnb','kro',2);
INSERT INTO vente VALUES ('vnb','heineken',2);
INSERT INTO vente VALUES ('cafe de la gare','royal club',4);