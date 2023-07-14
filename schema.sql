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

-- set species_id value
UPDATE animals
SET species_id = (
  CASE
    WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
    ELSE (SELECT id FROM species WHERE name = 'Pokemon')
  END
);

 
-- create a new table named vets
CREATE TABLE vets (
  id  INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(255),
  age INTEGER,
  date_of_graduation DATE,
  PRIMARY KEY(id)
);

-- Create a "join table" called specializations to handle many to many relationship
CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);

-- Create a "join table" called visits to handle many to many relationship
CREATE TABLE visits (
  vet_id INTEGER REFERENCES vets(id),
  animal_id INTEGER REFERENCES animals(id),
  visit_date DATE,
  PRIMARY KEY (vet_id, animal_id)
);