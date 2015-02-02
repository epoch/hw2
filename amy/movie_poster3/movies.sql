CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    title TEXT,
    year TEXT,
    director TEXT,
    plot TEXT,
    imdbID TEXT,
    imdbRating TEXT,
    poster TEXT,
    kind TEXT,
    response TEXT
);

--in the terminal the very first line you run is 
--sqlite3 butterflies.db < butterflies.sql
--sqlite3 butterflies.db
--INSERT INTO butterflies (name, family) VALUES ("Monarch", "Nymph");
--SELECT * FROM butterflies;