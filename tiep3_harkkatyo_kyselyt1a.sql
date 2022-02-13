-- Tietokantojen perusteet 2020
-- Harkkatyön kyselyt 1 A
-- henri.seppa@tuni.fi




SELECT ljtunti.viikonpaiva, ljtunti.alkamisaika, rltunti.rlnimi, rltunti.kesto
FROM ljtunti, rltunti, kategoria
WHERE ljtunti.rltunnus = rltunti.rltunnus and rltunti.ktunnus = kategoria.ktunnus and kategoria.knimi = 'Kehonhuolto'
ORDER BY ljtunti.viikonpaiva,ljtunti.alkamisaika,rltunti.rlnimi ASC;