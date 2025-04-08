\prompt 'Adja meg a recept ID-jét: ' receptid
\prompt 'Adja meg a recept sorszámát: ' recept_sorszám
\prompt 'Adja meg a összetevő ID-jét: ' összetevő_id
\prompt 'Adja meg a mennyiséget: ' mennyiség
\prompt 'Adja meg a mérték mennyiség ID-jét: ' mérték_mennyiség_id
\prompt 'Adja meg az összetevő osztály ID-jét: ' összetevő_osztály_id
\prompt 'Adja meg a recept osztály ID-jét: ' recept_osztály_id


SELECT InteractiveRecipeIngredientsUploader(:receptid, :recept_sorszám, :összetevő_id, :mennyiség, :mérték_mennyiség_id, :összetevő_osztály_id, :recept_osztály_id);
