/* Populate database with sample data. */

INSERT INTO animals 
VALUES (DEFAULT, 'Agumon', '2020-02-03', 0, true, 10.23),
       (DEFAULT, 'Gabumon', '2018-11-15', 2, true, 8.0),
       (DEFAULT, 'Pikachu', '2021-01-07', 1, false, 15.04),
       (DEFAULT, 'Devimon', '2017-05-12', 5, true, 11.0);

/* Insert new animals into the table */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES 
('Charmander', '2020-02-08', -11, false, 0),
('Plantmon', '2021-11-15', -5.7, true, 2),
('Squirtle', '1993-04-02', -12.13, false, 3),
('Angemon', '2005-06-12', -45, true, 1),
('Boarmon', '2005-06-07', 20.4, true, 7),
('Blossom', '1998-10-13', 17, true, 3),
('Ditto', '2022-05-14', 22, true, 4);

-- Insert data into ownwers table
INSERT INTO owners (full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

-- insert data into species table
INSERT INTO species (name)
VALUES
  ('Pokemon'),
  ('Digimon');

-- modify animals to have owners_id information
ALTER TABLE animals
ADD COLUMN owner_id INTEGER,
ADD CONSTRAINT fk_owner
FOREIGN KEY (owner_id)
REFERENCES owners(id);

UPDATE animals
SET owner_id = (
  SELECT id
  FROM owners
  WHERE owners.full_name = 'Sam Smith'
  LIMIT 1
)
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = (
  SELECT id
  FROM owners
  WHERE owners.full_name = 'Jennifer Orwell'
  LIMIT 1
)
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = (
  SELECT id
  FROM owners
  WHERE owners.full_name = 'Bob'
  LIMIT 1
)
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = (
  SELECT id
  FROM owners
  WHERE owners.full_name = 'Melody Pond'
  LIMIT 1
)
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = (
  SELECT id
  FROM owners
  WHERE owners.full_name = 'Dean Winchester'
  LIMIT 1
)
WHERE name IN ('Angemon', 'Boarmon');