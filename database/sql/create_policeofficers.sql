CREATE TABLE IF NOT EXISTS policeofficers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    rank VARCHAR(50),
    department VARCHAR(100)
);
