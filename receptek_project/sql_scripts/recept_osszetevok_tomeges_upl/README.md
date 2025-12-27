
# Run;

```bash
sudo -u postgres psql -d receptek_utf8_restore_test -v ON_ERROR_STOP=1 \
  -v MODE=validate -v EXACT=false \
  -f /home/debiana/w3school/objexamples/police-simulation-framework/receptek_project/sql_scripts/recept_osszetevok_tomeges_upl/load_from_config_strict.sql
#
sudo -u postgres psql -d receptek_utf8_restore_test -v ON_ERROR_STOP=1 -c "DELETE FROM public.recept_osszetevok;"
sudo -u postgres psql -d receptek_utf8_restore_test \
  -v MODE=apply -v EXACT=false \
  -f /home/debiana/w3school/objexamples/police-simulation-framework/receptek_project/sql_scripts/recept_osszetevok_tomeges_upl/load_from_config_strict.sql
```

# Run validate - safe:

```bash
sudo -u postgres psql -d receptek_utf8_restore_test -v ON_ERROR_STOP=1 \
  -v MODE=validate -v EXACT=false \
  -f /home/debiana/w3school/objexamples/police-simulation-framework/receptek_project/sql_scripts/recept_osszetevok_tomeges_upl/load_from_config_strict.sql
```

# Create sandbox:

```bash
sudo -u postgres psql -d receptek_utf8_restore_test -v ON_ERROR_STOP=1
```
```sql
BEGIN;
DELETE FROM public.recept_osszetevok;

\set MODE apply
\set EXACT false
\i /home/debiana/w3school/objexamples/police-simulation-framework/receptek_project/sql_scripts/recept_osszetevok_tomeges_upl/load_from_config_strict.sql

-- Itt NEM COMMIT, hanem:
ROLLBACK;
```


