-- Exercice 2.2.1 --

use CINEMA_MTP ;


-- a --
select * 
from film as f, programme as p, salle 
where f.titre = 'Speed 2' and f.titre = p.titre;

-- b --
SELECT * 
FROM programme 
WHERE titre = 'Eyes wide shut ' 
AND horaire > '14:00:00';

-- c --
SELECT *
FROM film
WHERE acteur = metteur_en_scene;

-- d --
SELECT * 
FROM programme 
WHERE titre ='marion' 
OR nom_cine = 'diagonal centre';

-- e --
SELECT f.titre, f.acteur, p.nom_cine, p.horaire
FROM film AS f
INNER JOIN programme AS p ON f.titre = p.titre
WHERE acteur = 'MF Pisier';

-- f --
SELECT f.titre, f.acteur, f.metteur_en_scene
FROM film AS f 
WHERE f.acteur = f.metteur_en_scene;

-- g --
SELECT titre, metteur_en_scene
from film
GROUP BY titre
HAVING COUNT( DISTINCT metteur_en_scene) >= 2;

-- h --
SELECT *
FROM film
WHERE titre = 'Marion';