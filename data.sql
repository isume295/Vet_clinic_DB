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