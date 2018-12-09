-- Exercice 3 --
drop database ClientsFournisseurs;
create database ClientsFournisseurs;
use ClientsFournisseurs;


create table fournisseurs(
    nomF VARCHAR(45) primary key,
    adresseF varchar(150)
);

create table prix(
    nomF varchar(45),
    nomP varchar(45),
    couts int(5),
    index ind_prix_nomp (nomP),
    constraint pk_prix primary key (nomF,nomP),
    constraint fk_prix_fourn foreign key (nomF) REFERENCES fournisseurs(nomF)
);

create table clients(
    nomC varchar(45) primary key,
    adresseC varchar(150),
    solde int
);

create table commandes(
    numCom int primary key auto_increment,
    nomC varchar(45),
    nomP varchar(45),
    quantite smallint,
    constraint fk_com_nomc foreign key (nomc) references clients(nomc),
    constraint fk_com_nomP foreign key (nomP) references prix(nomp)
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data_fournisseursClients/fournisseurs.csv' 
INTO TABLE fournisseurs
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nomF, adresseF);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data_fournisseursClients/clients.csv' 
INTO TABLE clients
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data_fournisseursClients/prix.csv' 
INTO TABLE prix
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/data_fournisseursClients/commandes.csv' 
INTO TABLE commandes
FIELDS TERMINATED BY ';' 
ENCLOSED BY ''
LINES TERMINATED BY '\n'
IGNORE 1 ROWS 
(nomC, nomP, quantite);
