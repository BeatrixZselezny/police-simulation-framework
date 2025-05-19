
-- Ez a script lekérdezi milyen funkciók vannak az adatbázisban --

SELECT n.nspname AS schema,
       p.proname AS function_name,
       pg_catalog.pg_get_function_arguments(p.oid) AS arguments,
       pg_catalog.pg_get_function_result(p.oid) AS result_type
FROM pg_catalog.pg_proc p
  JOIN pg_catalog.pg_namespace n ON n.oid = p.pronamespace
WHERE n.nspname NOT IN ('pg_catalog', 'information_schema')
ORDER BY 1, 2;

