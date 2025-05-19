CREATE TABLE IF NOT EXISTS recept_osszetevok_audit (
    id SERIAL PRIMARY KEY,
    receptid INT,
    összetevő_id INT,
    módosítás_típusa TEXT,
    módosítás_ideje TIMESTAMP DEFAULT current_timestamp,
    régi_érték JSONB,
    új_érték JSONB
);


