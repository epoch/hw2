CREATE TABLE posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT,
    image TEXT,
    description TEXT,
    full_text TEXT,
    category TEXT,
    created_at TEXT,
    updated_at TEXT
);


--in the terminal the very first line you run is 
--sqlite3 butterflies.db < butterflies.sql
--sqlite3 butterflies.db
--INSERT INTO butterflies (name, family) VALUES ("Monarch", "Nymph");
--SELECT * FROM butterflies;