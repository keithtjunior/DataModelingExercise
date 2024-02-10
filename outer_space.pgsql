DROP DATABASE IF EXISTS outer_space WITH (FORCE);

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  in_galaxy INTEGER REFERENCES galaxies
);

CREATE TABLE satellites
(
  id SERIAL PRIMARY KEY,
  moons TEXT[]
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  moons INTEGER REFERENCES satellites
);

CREATE TABLE solar_systems
(
  star_id INTEGER REFERENCES stars,
  planet_id INTEGER REFERENCES planets
);

INSERT INTO galaxies
  (name)
VALUES
  ('Milky Way');

INSERT INTO stars
  (name, in_galaxy)
VALUES
  ('The Sun', 1),
  ('Proxima Centauri', 1),
  ('Gliese 876', 1);

INSERT INTO satellites
  (moons)
VALUES
  ('{}'),
  ('{"The Moon"}'),
  ('{"Phobos", "Deimos"}'),
  ('{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}');

INSERT INTO planets
  (name, orbital_period_in_years, moons)
VALUES
  ('Earth', 1.00, 2),
  ('Mars', 1.88, 3),
  ('Venus', 0.62, 1),
  ('Neptune', 164.8, 4),
  ('Proxima Centauri b', 0.03, 1),
  ('Gliese 876 b', 0.23, 1);

INSERT INTO solar_systems
  (star_id, planet_id)
VALUES
  (1,1),
  (1,2),
  (1,3),
  (1,4),
  (2,5),
  (3,6);