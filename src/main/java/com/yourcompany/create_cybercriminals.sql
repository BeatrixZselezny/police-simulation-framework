CREATE TABLE IF NOT EXISTS cybercriminals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    expertise VARCHAR(100),
    age INT,
    botnet_id INT,
    FOREIGN KEY (botnet_id) REFERENCES botnet(id)
);
