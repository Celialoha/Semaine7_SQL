USE db_dragons;


-- a --
SELECT d1.dragon 
FROM dragons AS d1 
INNER JOIN dragons AS d2 ON d1.dragon = d2.dragon
WHERE d1.crache_feu = 'oui';

-- b --
select d1.dragon 
from dragons as d1 
inner join dragons as d2 on d1.dragon = d2.dragon
where d1.crache_feu = 'oui' and d1.sexe = 'M';

-- c --
select d1.dragon 
from dragons as d1 
inner join dragons as d2 
on d1.dragon = d2.dragon
where d1.crache_feu = 'non' and d1.sexe = 'F';

-- d --
select dragon_aimant     
from aime ;

-- e --
select a1.dragon_aimant 
from aime as a1, aime as a2 
where a1.dragon_aimant = a2.dragon_aimant 
and a1.force_amour = "'passionnément'" ;

-- f --
select distinct r1.dragon 
from repas as r1 
inner join repas as r2 
on r1.dragon = r2.dragon
where r1.produit = 'oeuf';


-- g --
select dragon 
from Dragons
where dragon NOT IN (SELECT dragon_aimant FROM aime);

-- h --
SELECT *
FROM aime AS a1, aime AS a2 
WHERE a1.dragon_aimant = a2.dragon_aime
AND a2.dragon_aimant = a1.dragon_aime;

-- i --
SELECT d.dragon
FROM dragons as d
WHERE d.dragon NOT IN 
(SELECT r.dragon FROM repas as r WHERE r.dragon = d.dragon);

-- j --
SELECT d.dragon
FROM dragons AS d 
WHERE d.dragon NOT IN
( SELECT d.dragon FROM aime WHERE dragon_aimant)
AND d.dragon NOT IN
( SELECT r.dragon FROM repas AS r  WHERE d.dragon = r.dragon);

-- k --
SELECT DISTINCT r.dragon
FROM repas as r
GROUP BY r.dragon
HAVING COUNT(r.produit) > 2;
