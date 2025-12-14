\prompt 'Adja meg a recept ID-jét: ' receptid
\prompt 'Adja meg a recept sorszámát: ' recept_sorszam
\prompt 'Adja meg a összetevő ID-jét: ' osszetevo_id
\prompt 'Adja meg a mennyiséget: ' mennyiség
\prompt 'Adja meg a mérték mennyiség ID-jét: ' mertek_mennyiseg_id
\prompt 'Adja meg az összetevő osztály ID-jét: ' osszetevo_osztaly_id
\prompt 'Adja meg a recept osztály ID-jét: ' recept_osztaly_id


SELECT InteractiveRecipeIngredientsUploader(:receptid, :recept_sorszam, :osszetevo_id, :mennyiség, :mertek_mennyiseg_id, :osszetevo_osztaly_id, :recept_osztaly_id);
