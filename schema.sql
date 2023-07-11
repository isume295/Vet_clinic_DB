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
