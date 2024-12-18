CREATE TABLE IF NOT EXISTS policestation (
    id SERIAL PRIMARY KEY,
    room_name VARCHAR(50),
    location VARCHAR(50),
    description TEXT
);
