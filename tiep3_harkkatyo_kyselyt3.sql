-- Tietokantojen perusteet 2020
-- Harkkatyön kyselyt 3
-- henri.seppa@tuni.fi




SELECT ohjaaja.otunnus as ohjtunnus, ohjaaja.onimi as ohjnimi
FROM ohjaaja
WHERE ohjaaja.otunnus NOT IN
(SELECT ohjaaja.otunnus
FROM ohjaaja, voi_ohjata, rltunti, kategoria
WHERE ohjaaja.otunnus = voi_ohjata.otunnus and voi_ohjata.rltunnus = rltunti.rltunnus
and rltunti.ktunnus = kategoria.ktunnus and knimi IN ('Lihashuolto','Kehonhuolto'))
ORDER BY ohjaaja.otunnus ASC;