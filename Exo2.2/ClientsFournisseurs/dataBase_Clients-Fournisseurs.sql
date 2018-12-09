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
    