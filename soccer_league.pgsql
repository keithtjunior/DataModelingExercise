DROP DATABASE IF EXISTS soccer_league WITH (FORCE);

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE players (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  team_id INTEGER REFERENCES teams
);

CREATE TABLE referees (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE seasons (
  id SERIAL PRIMARY KEY,
  start_date DATE NOT NULL DEFAULT NOW(),
  end_date DATE NOT NULL DEFAULT NOW()
);

CREATE TABLE matches (
  id SERIAL PRIMARY KEY,
  date DATE NOT NULL DEFAULT NOW(),
  team_1_id INTEGER REFERENCES teams NOT NULL,
  team_2_id INTEGER REFERENCES teams NOT NULL
);

CREATE TABLE match_referees (
  match_id INTEGER REFERENCES matches NOT NULL,
  referee_id INTEGER REFERENCES referees NOT NULL
);

CREATE TABLE goals (
  match_id INTEGER REFERENCES matches NOT NULL,
  player_id INTEGER REFERENCES players NOT NULL,
  goals_scored INTEGER NOT NULL DEFAULT 1,
  first_half BOOLEAN NOT NULL DEFAULT TRUE,
  time TIME NOT NULL DEFAULT '00:00:00'
);


INSERT INTO teams
  (name)
  VALUES
  ('Manchester City'),
  ('Bayern Munich'),
  ('Real Madrid'),
  ('Liverpool');

INSERT INTO players
  (name, team_id)
  VALUES
  ('Erling Haaland', 1),
  ('Kevin De Bruyne', 1),
  ('Harry Kane', 2),
  ('Manuel Neuer', 2),
  ('Jude Bellingham', 3),
  ('Vinicius Junior', 3),
  ('Mohamed Salah', 4),
  ('Darwin Núñez', 4);

INSERT INTO referees
  (name)
  VALUES
  ('Referee 1'),
  ('Referee 2'),
  ('Referee 3');

INSERT INTO seasons
  (start_date, end_date)
  VALUES
  ('2023-2-25' , '2023-10-21'),
  ('2022-2-26' , '2022-10-10');

INSERT INTO matches
  (date, team_1_id, team_2_id)
  VALUES
  ('2023-3-15', 1, 3),
  ('2023-4-5', 4, 2);

INSERT INTO match_referees
  (match_id, referee_id)
  VALUES
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3);

INSERT INTO goals
  (match_id, player_id, goals_scored, first_half, time)
  VALUES
  (1, 6, 2, False, '00:22:52'),
  (2, 3, 1, True, '00:13:08'),
  (2, 4, 1, False, '00:16:39'),
  (2, 7, 1, True, '00:40:42');
  