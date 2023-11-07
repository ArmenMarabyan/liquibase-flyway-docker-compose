INSERT INTO person (email, name) VALUES ('john@gmail.com', 'John Doe');

ALTER TABLE person
    ADD fname VARCHAR(255) NOT NULL;

ALTER TABLE person
    ADD lname VARCHAR(255) NOT NULL;

UPDATE person SET fname = SUBSTRING_INDEX(name, ' ', 1);
UPDATE person SET lname = SUBSTRING_INDEX(name, ' ', -1);

ALTER TABLE person DROP COLUMN name;