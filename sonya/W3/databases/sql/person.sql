CREATE TABLE person (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INTEGER
);

CREATE TABLE pet (
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT,
    age INTEGER,
    dead INTEGER
);

CREATE TABLE person_pet (
    person_id INTEGER,
    pet_id INTEGER
);

INSERT INTO person (id, first_name, last_name, age) VALUES (0, "Zed", "Shaw", 37);

INSERT INTO pet (id, name, breed, age, dead) VALUES (0, "Fluffy", "unicorn", 1000, 0);

INSERT INTO pet VALUES (3, "Gigantor", "robot", 1, 1);

INSERT INTO person_pet (person_id, pet_id) VALUES (0,0);

INSERT INTO person_pet VALUES (0, 3);

DELETE FROM pet WHERE dead = 1; 

-- UPDATE EXAMPLE
UPDATE person SET first_name = 'Hilarious Guy' WHERE first_name = 'Zed';