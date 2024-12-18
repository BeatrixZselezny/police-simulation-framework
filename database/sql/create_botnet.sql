CREATE TABLE IF NOT EXISTS botnet (
    id SERIAL PRIMARY KEY,
    botnet_name VARCHAR(100),
    command VARCHAR(100),
    target VARCHAR(100),
    message TEXT
);
