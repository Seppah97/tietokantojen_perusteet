-- Tietokantojen perusteet 2020
-- Harkkatyön kyselyt 1 A
-- henri.seppa@tuni.fi




SELECT ljtunti.viikonpaiva, ljtunti.alkamisaika, rltunti.rlnimi, rltunti.kesto, snimi
FROM ljtunti, rltunti, kategoria, sali
WHERE ljtunti.rltunnus = rltunti.rltunnus and rltunti.ktunnus = kategoria.ktunnus and kategoria.knimi = 'Kehonhuolto'
and (ljtunti.paattymisaika < '10:00:00' or ljtunti.alkamisaika > '18:00:00') and ljtunti.stunnus = sali.stunnus
ORDER BY ljtunti.viikonpaiva,ljtunti.alkamisaika,rltunti.rlnimi ASC;