-- Tietokantojen perusteet 2020
-- Harkkatyön kyselyt 4b
-- henri.seppa@tuni.fi




SELECT knimi, COUNT(DISTINCT rltunti.rltunnus) as rltuntilkm, COUNT(ljtunti.rltunnus) as ljtuntilkm, COUNT(DISTINCT ljtunti.otunnus) as ohjaajalkm
FROM kategoria LEFT OUTER JOIN rltunti ON kategoria.ktunnus = rltunti.ktunnus LEFT OUTER JOIN ljtunti ON rltunti.rltunnus = ljtunti.rltunnus
GROUP BY kategoria.ktunnus, rltunti.ktunnus
HAVING kategoria.ktunnus = rltunti.ktunnus
ORDER BY knimi ASC;