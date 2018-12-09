-- Exercice 5 : Les boissons --
use Boissons;

-- a --
select f.bar
from frequente f 
where f.personne = 'Charles Dupont';

-- b --
select s.bar 
from sert s 
inner join aime a on s.biere = a.biere
where a.personne = 'Charles Dupont';

-- c --
select f.personne
from frequente f 
inner join aime a on f.personne = a.personne
inner join sert s on a.biere = s.biere
inner join frequente f on f.bar = s.bar;

-- d --

-- e --
select v.biere, sum(v.montant)
from vente v
group by v.biere
order by sum(v.montant) desc;

-- f --
select v.bar, v.biere, avg(v.montant)
from vente v
group by v.bar;

-- g --
select max(v.montant), v.biere
from vente v
where count(v.bar)>= 2;

-- h --
select a.personne, count(a.biere)
from aime a 
group by a.personne
order by count(a.biere) asc;

-- i --
select s.personne
from  sert s 
where not exists (select s.biere from sert s where s.biere not in
(select a.biere from aime a where a.biere = s.biere)) 
having count(distinct s.bar) > 1;
