use SPECTACLES;

-- a --
SELECT Intervenant, Titre
FROM Intervenants
WHERE titre = 'L\'avare';

-- b --
SELECT i.intervenant, i.titre
FROM Intervenants as i
WHERE i.intervenant NOT IN 
	(SELECT x.intervenant FROM Intervenants as x WHERE x.titre = 'L\'avare');

-- c --
SELECT DISTINCT I.intervenant
FROM intervenants As I 
JOIN spectacles S ON I.titre = S.titre
JOIN places P ON S.semaine = P.semaine
JOIN salles as sa On Sa.salle = P.salle
GROUP BY I.intervenant, P.semaine , P.jour
HAVING SUM(SA.nombreplaces)>200;

-- d --
SELECT DISTINCT sp.Salle
FROM Spectacles as sp
GROUP BY sp.salle, sp.semaine
HAVING COUNT(sp.semaine) < 3;

-- e --
SELECT p.semaine, p.jour, sp.titre
FROM places as p
JOIN Spectacles as sp ON p.semaine = sp.semaine AND p.salle = sp.salle
JOIN intervenants as i ON i.titre = sp.titre
WHERE disponibilite > 0 AND intervenant = 'Pierre';

SELECT semaine, sp.titre, intervenant
FROM Spectacles as sp
JOIN intervenants as i ON i.titre = sp.titre
WHERE intervenant = 'Pierre';

-- f --
SELECT INTERVENANT
FROM INTERVENANTS
INNER JOIN spectacles
ON intervenants.titre = spectacles.titre
GROUP BY spectacles.salle
HAVING (COUNT(SALLE = 3));