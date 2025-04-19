#!/bin/bash
csv_file="/police/receptek_project/sql_scripts/recept_összetevők_tömeges_upl/data.csv"

db_name="receptek_utf8"
db_user="postgres"
log_file="skipped_ids.log"
echo "" > "$log_file"

   while IFS=, read -r receptid recept_sorszám összetevő_id mennyiség mérték_mennyiség_id összetevő_osztály_idrecept_osztály_id
   do
	   check_result=$(psql -U "$db_user" -d "$db_name" -t -c "SELECT EXISTS(SELECT 1 FROM recept_összetevők WHERE receptid = '$receptid' AND recept_sorszám = '$recept_sorszám');")

	   if [[ "$check_result" =~ t]]; then
		   echo "ReceptID már létezik: $receptid, kihagyva..." | tee -a "$log_file"
		   continue
	   fi

	   psql -U "$db_user" -d "$db_name" -c "SELECT InteractiveRecipeMultiUploader('$receptid','$recept_sorszám','$összetevő_id','$mennyiség','$mérték_mennyiség_id','$összetevő_osztály_id','$recept_osztály_id');"

	   echo "Sikeresen feldolgozva: $receptid"
   done < $csv_file
   echo "Feldolgozás befejezve! Kimaradt ID-k naplózva a $log_file fájlba."
   
