
-- Ha létezik a tábla, előbb töröljük biztonságosan (csak sandboxban!)
DROP TABLE IF EXISTS receptek CASCADE;

CREATE TABLE receptek (
    receptid SERIAL PRIMARY KEY,
    nev TEXT NOT NULL,
    leiras TEXT,
    letrehozas_datum TIMESTAMP DEFAULT now()
);

DROP TABLE IF EXISTS összetevők CASCADE;

CREATE TABLE összetevők (
    osszetevoid SERIAL PRIMARY KEY,
    nev TEXT NOT NULL,
    osztaly_id INT
);

-- Kapcsolótábla, ha sok-sok kapcsolat van
DROP TABLE IF EXISTS recept_összetevők CASCADE;

CREATE TABLE recept_összetevők (
    receptid INT REFERENCES receptek(receptid) ON DELETE CASCADE,
    osszetevoid INT REFERENCES összetevők(osszetevoid) ON DELETE CASCADE,
    mennyiseg NUMERIC(10,2) NOT NULL,
    mertekegyseg TEXT,
    PRIMARY KEY (receptid, osszetevoid)
);

