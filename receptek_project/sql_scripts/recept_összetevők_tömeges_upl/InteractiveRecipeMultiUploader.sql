\prompt 'Adj meg egy receptid értéket: ' receptid
\prompt 'Add meg a receptek sorszámait (pl.: (100, 101, 102, 103): ' recept_sorszám
\prompt 'Adj meg az összetevő_id-ket (pl.: 1,2,3,4): ' összetevő_id
\prompt 'Add meg a receptekhez tartozó mennyiségeket (pl.: 20, 30, 40, 50): ' mennyiség
\prompt 'Add meg a mérték_mennyiség_id-ket (pl.: 1,2,3,4): ' mérték_mennyiség_id
\prompt 'Add meg az összetevő_osztály_id-ket (pl.: 1,2,3,4): ' összetevő_osztály_id
\prompt 'Add meg a recept_osztály_id-ket (pl.: 1,2,3,4): ' recept_osztály_id
 
SELECT InteractiveRecipeMultiUploader.sql(:receptid, :recept_sorszám, :összetevő_id, :mennyiség, :mérték_mennyiség_id, :összetevő_osztály_id, :recept_osztály_id);
