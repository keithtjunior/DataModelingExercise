DROP DATABASE IF EXISTS air_traffic WITH (FORCE);

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city INTEGER REFERENCES cities,
  to_city INTEGER REFERENCES cities,
  airline_id INTEGER REFERENCES airlines
);

CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  passenger_id INTEGER REFERENCES passengers,
  flight_id INTEGER REFERENCES flights
);


INSERT INTO passengers
  (first_name, last_name)
VALUES
  ('Jennifer', 'Finch'),
  ('Thadeus', 'Gathercoal'),
  ('Sonja', 'Pauley'),
  ('Waneta', 'Skeleton'),
  ('Berkie', 'Wycliff'),
  ('Alvin', 'Leathes'),
  ('Cory', 'Squibbes');

INSERT INTO airlines
  (name)
VALUES
  ('United'),
  ('British Airways'),
  ('Delta'),
  ('TUI Fly Belgium'),
  ('Air China'),
  ('American Airlines'),
  ('Avianca Brasil');

INSERT INTO countries
  (name)
VALUES
  ('United States'),
  ('Mexico'),
  ('Brazil'),
  ('Chile'),
  ('United Kingdom'),
  ('France'),
  ('Morocco'),
  ('UAE'),
  ('China'),
  ('Japan');

INSERT INTO cities
  (name, country_id)
VALUES
  ('Washington DC', 1),
  ('Seattle', 1),
  ('New York', 1),
  ('Tokyo', 10),
  ('London', 5),
  ('Charlotte', 1),
  ('Chicago', 1),
  ('New Orleans', 1),
  ('Cedar Rapids', 1),
  ('Los Angeles', 1),
  ('Las Vegas', 1),
  ('Mexico City', 2),
  ('Paris', 6),
  ('Casablanca', 7),
  ('Dubai', 8),
  ('Beijing', 9),
  ('Sao Paolo', 3),
  ('Santiago', 4);

INSERT INTO flights
  (departure, arrival, from_city, to_city, airline_id)
VALUES
  ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 2, 1),
  ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 4, 5, 2),
  ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 10, 11, 3),
  ('2018-04-15 16:50:00', '2018-04-15 21:00:00', 2, 12, 3),
  ('2018-08-01 18:30:00', '2018-08-01 21:50:00', 13, 14, 4),
  ('2018-10-31 01:15:00', '2018-10-31 12:55:00', 15, 16, 5),
  ('2019-02-06 06:00:00', '2019-02-06 07:47:00', 3, 6, 1),
  ('2018-12-22 14:42:00', '2018-12-22 15:56:00', 9, 7, 6),
  ('2019-02-06 16:28:00', '2019-02-06 19:18:00', 6, 8, 6),
  ('2019-01-20 19:30:00', '2019-01-20 22:45:00', 17, 18, 7);

INSERT INTO tickets
  (seat, passenger_id, flight_id)
VALUES
  ('33B', 1, 1),
  ('8A', 2, 2),
  ('12F', 3, 3),
  ('20A', 1, 4),
  ('23D', 4, 5),
  ('18C', 2, 6),
  ('9E', 5, 7),
  ('1A', 6, 8),
  ('32B', 5, 9),
  ('10D', 7, 10);
