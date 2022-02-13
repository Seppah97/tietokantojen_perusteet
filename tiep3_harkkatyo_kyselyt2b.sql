-- Tietokantojen perusteet 2020
-- Harkkatyön kyselyt 1 A
-- henri.seppa@tuni.fi




SELECT rltunti.rlnimi, rltunti.kesto, knimi
FROM rltunti, kategoria, (SELECT MIN(kesto) as kesto
FROM rltunti) AS minimi
WHERE rltunti.kesto = minimi.kesto and rltunti.ktunnus = kategoria.ktunnus
ORDER BY rlnimi ASC;