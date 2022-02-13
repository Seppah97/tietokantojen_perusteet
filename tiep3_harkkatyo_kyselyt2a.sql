-- Tietokantojen perusteet 2020
-- Harkkatyön kyselyt 2 b
-- henri.seppa@tuni.fi




SELECT rltunti.rlnimi, rltunti.kesto, knimi
FROM rltunti, kategoria
WHERE rltunti.kesto = (SELECT MIN(rltunti.kesto)
FROM rltunti) and rltunti.ktunnus = kategoria.ktunnus
ORDER BY rlnimi ASC;