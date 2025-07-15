-- 03_sequences_audit.sql
-- SERIAL mezőkhöz tartozó sequence-ek ellenőrzése

SELECT
    s.relname AS sequence_name,
    t.relname AS table_name,
    a.attname AS column_name,
    seq.last_value AS current_sequence_value,
    max(tbl."value_column") AS max_column_value
FROM
    pg_class s
    JOIN pg_depend d ON d.objid = s.oid
    JOIN pg_class t ON d.refobjid = t.oid
    JOIN pg_attribute a ON a.attrelid = t.oid AND a.attnum = d.refobjsubid
    JOIN pg_sequences seq ON seq.schemaname = 'public' AND seq.sequencename = s.relname
    JOIN (
        SELECT 'receptek' AS table_name, 'receptid' AS column_name, MAX(receptid) AS value_column
        FROM receptek
        -- Add more UNIONs here for other tables if needed
    ) tbl ON tbl.table_name = t.relname AND tbl.column_name = a.attname
GROUP BY s.relname, t.relname, a.attname, seq.last_value;
