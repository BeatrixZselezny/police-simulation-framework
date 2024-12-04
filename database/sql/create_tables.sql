CREATE TABLE policeofficers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    rank VARCHAR(50),
    station_id INT
);

CREATE TABLE policestation (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100)
);

CREATE TABLE crimes (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50),
    description TEXT,
    date DATE,
    officer_id INT
);
