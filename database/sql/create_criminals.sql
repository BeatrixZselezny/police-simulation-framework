CREATE TABLE IF NOT EXISTS criminals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    role VARCHAR(50),
    organization VARCHAR(100)
);
