CREATE TABLE IF NOT EXISTS simulation (
    id SERIAL PRIMARY KEY,
    scenario VARCHAR(100),
    result VARCHAR(100),
    date DATE
);
