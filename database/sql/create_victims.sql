CREATE TABLE IF NOT EXISTS victims (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    hair_color VARCHAR(50),
    crime_id INT,
    FOREIGN KEY (crime_id) REFERENCES crimes(id)
);

