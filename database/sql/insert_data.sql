INSERT INTO policeofficers (name, rank, station_id) VALUES
('John Doe', 'Sergeant', 1),
('Jane Smith', 'Lieutenant', 2),
('Emily Davis', 'Captain', 3);

INSERT INTO policestation (name, location) VALUES
('Central Station', 'Downtown'),
('North Station', 'North Side');

INSERT INTO crimes (type, description, date, officer_id) VALUES
('Robbery', 'Bank robbery at Central Bank', '2024-12-01', 1),
('Assault', 'Assault in North Park', '2024-12-02', 2);
