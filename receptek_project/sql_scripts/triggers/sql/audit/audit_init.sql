-- audit_init.sql
-- Futtatás: psql -U postgres -d receptek_utf8 -f /home/debiana/w3school/objexamples/police/receptek_project/sql_scripts/triggers/sql/audit/audit_init.sql

\i /home/debiana/w3school/objexamples/police/receptek_project/sql_scripts/triggers/sql/audit/tables/recept_osszetevok_audit.sql

\i /home/debiana/w3school/objexamples/police/receptek_project/sql_scripts/triggers/sql/audit/triggers/trg_recept_osszetevok.sql

\i /home/debiana/w3school/objexamples/police/receptek_project/sql_scripts/triggers/sql/audit/views/recept_osszetevok_napi_valtozas_view.sql

