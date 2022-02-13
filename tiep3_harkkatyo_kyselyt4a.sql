-- Tietokantojen perusteet 2020
-- Harkkatyön kyselyt 4a
-- henri.seppa@tuni.fi




SELECT knimi, COUNT(*) as lkm, MIN(kesto) as minkesto, MAX(kesto) as maxkesto
FROM kategoria, rltunti
GROUP BY kategoria.ktunnus, rltunti.ktunnus
HAVING kategoria.ktunnus = rltunti.ktunnus
ORDER BY knimi ASC;