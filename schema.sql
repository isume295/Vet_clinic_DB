/*to create Database*/

CREATE DATABASE vet_clinic;

/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id  INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(5,2),
  PRIMARY KEY(id)
);

/* add new column to animals table called species */
ALTER TABLE animals
ADD COLUMN species VARCHAR(255);

-- create new table called owners
CREATE TABLE owners (
  id  INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(255),
  age INTEGER,
  PRIMARY KEY(id)
);

-- create new table called species
CREATE TABLE species (
  id  INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  PRIMARY KEY(id)
);

-- remove species from animals table
ALTER TABLE animals
DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD COLUMN species_id INTEGER,
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species(id);

--
UPDATE animals
SET species_id = (
  CASE
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
  END
);

