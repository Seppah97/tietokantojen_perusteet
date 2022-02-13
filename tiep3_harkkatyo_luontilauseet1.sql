-- Tietokantojen perusteet 2020
-- Harkkatyön luontilauseet
-- henri.seppa@tuni.fi


CREATE TABLE ohjaaja(
otunnus INT,
onimi VARCHAR(40) NOT NULL,
syntymaaika DATE NOT NULL,
PRIMARY KEY (otunnus));

INSERT INTO ohjaaja VALUES(2000, 'Elisa Markkanen', '1986-01-21');
INSERT INTO ohjaaja VALUES(2001, 'Eero Ilonen', '1988-03-14');
INSERT INTO ohjaaja VALUES(2002, 'Mikko Kontinen', '1977-11-01');

CREATE TABLE sali(
stunnus INT,
snimi VARCHAR(20) NOT NULL,
paikkalkm INT,
PRIMARY KEY (stunnus),
UNIQUE (snimi)
);

INSERT INTO sali VALUES(1000, 'Sali 1', 25);
INSERT INTO sali VALUES(1001, 'Spinning-sali', 20);
INSERT INTO sali VALUES(1002, 'Sali 3', 20);

CREATE TABLE kategoria(
ktunnus INT,
knimi VARCHAR(20) NOT NULL,
PRIMARY KEY (ktunnus),
UNIQUE (knimi));

INSERT INTO kategoria VALUES(100, 'Lihaskunto');
INSERT INTO kategoria VALUES(101, 'Kehonhuolto');
INSERT INTO kategoria VALUES(102, 'Spinning');


CREATE TABLE rltunti(
rltunnus INT,
rlnimi VARCHAR(20) NOT NULL,
kuvaus VARCHAR(50),
kesto INT,
taso INT,
CONSTRAINT taso CHECK (taso BETWEEN 1 AND 4),
ktunnus INT NOT NULL,
PRIMARY KEY (rltunnus),
UNIQUE (rlnimi),
FOREIGN KEY (ktunnus) REFERENCES kategoria(ktunnus));

INSERT INTO rltunti VALUES(3000, 'Muokkaus', 'Muokataan lihaksia',45,2,100);
INSERT INTO rltunti VALUES(3001, 'Joogan perusteet', 'Opetellaan joogaa', 50, 1, 101);
INSERT INTO rltunti VALUES(3002, 'Jooga 1', 'Jatketaan joogaamista', 50, 2, 101);
INSERT INTO rltunti VALUES(3003, 'Pilates 1', 'Opetellaan pilatesta', 60, 2, 101);
INSERT INTO rltunti VALUES(3004, 'Spinning alkeet', 'Poljetaan', 60, 1, 102);
INSERT INTO rltunti VALUES(3005, 'Spinning pro', 'Raskaita osuuksia ja tiukkoja spurtteja', 80, 4, 102);

CREATE TABLE ljtunti (
rltunnus INT,
viikonpaiva VARCHAR(20),
alkamisaika TIME,
paattymisaika TIME NOT NULL,
maxosallistujalkm INT,
otunnus INT NOT NULL,
stunnus INT NOT NULL,
PRIMARY KEY (rltunnus, viikonpaiva,alkamisaika),
FOREIGN KEY (otunnus) REFERENCES ohjaaja(otunnus),
FOREIGN KEY (stunnus) REFERENCES sali(stunnus),
FOREIGN KEY (rltunnus) REFERENCES rltunti(rltunnus)
);

INSERT INTO ljtunti VALUES(3002, 'ma', '08:10', '09:00', 10, 2000, 1002);
INSERT INTO ljtunti VALUES(3002, 'ma', '13:00', '13:50', 15, 2000, 1000);
INSERT INTO ljtunti VALUES(3002, 'ma', '20:10', '21:00', 10, 2000, 1002);
INSERT INTO ljtunti VALUES(3002, 'ti', '08:10', '09:00', 15, 2001, 1000);
INSERT INTO ljtunti VALUES(3003, 'ma', '08:00', '09:00', 15, 2001, 1000);
INSERT INTO ljtunti VALUES(3005, 'ma', '07:00', '08:20', 20, 2002, 1001);
INSERT INTO ljtunti VALUES(3004, 'ma', '10:45', '11:45', 20, 2002, 1001);
INSERT INTO ljtunti VALUES(3005, 'pe', '14:00', '15:20', 20, 2000, 1001);

CREATE TABLE voi_ohjata(
otunnus INT,
rltunnus INT,
PRIMARY KEY (otunnus,rltunnus),
FOREIGN KEY (otunnus) REFERENCES ohjaaja(otunnus),
FOREIGN KEY (rltunnus) REFERENCES rltunti(rltunnus));


INSERT INTO voi_ohjata VALUES(2000,3002);
INSERT INTO voi_ohjata VALUES(2000, 3004);
INSERT INTO voi_ohjata VALUES(2000,3005);

INSERT INTO voi_ohjata VALUES(2001, 3001);
INSERT INTO voi_ohjata VALUES(2001, 3002);
INSERT INTO voi_ohjata VALUES(2001,3003);

INSERT INTO voi_ohjata VALUES(2002, 3004);
INSERT INTO voi_ohjata VALUES(2002, 3005);