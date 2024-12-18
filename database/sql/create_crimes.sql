CREATE TABLE IF NOT EXISTS crimes (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50),
    description TEXT,
    date DATE,
    officer_id INT,
    detective_id INT,
    category VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (officer_id) REFERENCES policeofficers(id),
    FOREIGN KEY (detective_id) REFERENCES detectives(id)
);
