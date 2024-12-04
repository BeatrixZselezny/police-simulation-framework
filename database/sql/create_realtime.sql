CREATE TABLE IF NOT EXISTS realtime (
    id SERIAL PRIMARY KEY,
    event_name VARCHAR(100),
    timestamp TIMESTAMP,
    description TEXT
);
