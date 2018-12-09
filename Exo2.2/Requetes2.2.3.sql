USE ClientsFournisseurs;


-- a --
SELECT Nomp, NomC
FROM  Commandes
WHERE NomC = 'Jean' ;

-- b --
SELECT p.Nomf
From Prix as p
INNER JOIN Commandes AS c ON c.NomP = p.NomP
Where c.NomC = 'Paul';

-- c --
SELECT f.NomF, f.adresseF, p.couts
FROM Fournisseurs as f
INNER JOIN Prix AS p ON f.NomF = p.NomF
WHERE p.NomP = 'parpaing' and p.couts < 1200;

-- d --
SELECT DISTINCT cl.nomC, cl.adresseC, f.nomF, f.adresseF
FROM fournisseurs AS f
INNER JOIN prix AS p ON f.nomF = p.nomF
INNER JOIN commandes AS c ON p.nomP = c.nomP
INNER JOIN clients AS cl ON c.NomC = cl.NomC
WHERE c.NomP = 'Briques';

-- e --
SELECT p.nomF, p.nomP
FROM prix AS p 
INNER JOIN commandes AS c ON c.nomP = p.nomP
WHERE c.nomC = 'jean';