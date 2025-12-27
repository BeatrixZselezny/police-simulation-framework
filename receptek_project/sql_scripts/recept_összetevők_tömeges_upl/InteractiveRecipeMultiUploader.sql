\prompt 'Add meg a receptid értékeket (pl.: 1,2,3,4): ' receptid
\prompt 'Add meg a receptek sorszámait (pl.: 100,101,102,103): ' recept_sorszam
\prompt 'Adj meg az osszetevo_id-ket (pl.: 1,2,3,4): ' osszetevo_id
\prompt 'Add meg a receptekhez tartozó mennyiségeket (pl.: 20,30,40,50): ' mennyiség
\prompt 'Add meg a mertek_mennyiseg_id-ket (pl.: 1,2,3,4): ' mertek_mennyiseg_id
\prompt 'Add meg az osszetevo_osztaly_id-ket (pl.: 1,2,3,4): ' osszetevo_osztaly_id
\prompt 'Add meg a recept_osztaly_id-ket (pl.: 1,2,3,4): ' recept_osztaly_id

SELECT InteractiveRecipeMultiUploader(
    :'receptid',
    :'recept_sorszam',
    :'osszetevo_id',
    :'mennyiség',
    :'mertek_mennyiseg_id',
    :'osszetevo_osztaly_id',
    :'recept_osztaly_id'
);

