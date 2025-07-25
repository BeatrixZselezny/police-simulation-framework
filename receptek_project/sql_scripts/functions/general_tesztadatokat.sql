CREATE OR REPLACE PROCEDURE general_tesztadatokat (
	IN konyv_szam INT DEFAULT 10000

)
LANGUAGE plpgsql
AS $$
BEGIN
	-- Kategóriák beszúrása
	INSERT INTO kategoriak (nev)
	VALUES
		('Fantasztikus'),
		('Krimi'),
		('Hobbi'),
		('Gyermekkönyv'),
		('Életmód'),
		('Irodalom'),
		('Művészet'),
		('Zene'),
		('Politika'),
		('Kultúra'),
		('Romantika'),
		('Ezoterika'),
		('Tankönyv'),
		('Kötelező'),
		('Történelem'),
		('Tudományok'),
		('Úti'),
		('Szótár'),
		('Vallás'),
		('Filozófia');

	-- Könyvek beszúrása
	INSERT INTO konyvek (cim, szerzo, ev, allapot, ar)
	SELECT
		'Könyv_' || gs AS cim,
		'Szerzo_' || (gs % 500) AS szerzo,
		1800 + (gs / 225),
		CASE
			WHEN gs % 3 = 0 THEN 'újszerű'
				WHEN gs % 3 = 1 THEN 'használt'
				ELSE 'antik'
				END,
				ROUND((RANDOM() * 100 + 500)::numeric, 2)
				FROM generate_series(1, konyv_szam) gs;
			END;
			$$;


	
