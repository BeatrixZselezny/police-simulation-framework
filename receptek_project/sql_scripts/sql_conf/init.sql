-- sql_conf/init.sql
-- Receptek projekt: adatbázis inicializálása fejlesztői környezethez
-- Ez a fájl az összes szükséges táblát, függvényt és triggert betölti.
-- FIGYELEM: Nem vizsgálja, hogy létezik-e már az adott objektum.

\echo '>> Táblák létrehozása...'
\i /home/debiana/w3school/objexamples/police/receptek_project/sql_scripts/structure/create_tables.sql

\echo '>> Audit függvények betöltése...'
\i /home/debiana/w3school/objexamples/police/receptek_project/sql_scripts/functions/recept_osszetevok_audit_fn.sql

\echo '>> Audit triggerek betöltése...'
\i /home/debiana/w3school/objexamples/police/receptek_project/sql_scripts/triggers/audit/trg_recept_osszetevok_audit.sql

\echo '>> Kész! Recept APU aláírta! 🎉'


