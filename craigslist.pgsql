DROP DATABASE IF EXISTS craigslist WITH (FORCE);

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE users (
  username VARCHAR(64) PRIMARY KEY UNIQUE NOT NULL,
  preferred_region INTEGER REFERENCES regions
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(64)
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title TEXT,
  post_text TEXT NOT NULL,
  location TEXT NOT NULL,
  region INTEGER REFERENCES regions,
  category INTEGER REFERENCES categories,
  username TEXT REFERENCES users
);


INSERT INTO regions
  (name)
  VALUES
  ('San Francisco'),
  ('Atlanta'),
  ('Seattle'),
  ('New York'),
  ('Boston');

INSERT INTO users
  (username, preferred_region)
  VALUES
  ('user1', 1),
  ('user2', 2),
  ('user3', 3),
  ('user4', 3),
  ('user5', 4);

  INSERT INTO categories
  (name)
  VALUES
  ('community'),
  ('jobs'),
  ('housing'),
  ('for sale'),
  ('services');

INSERT INTO posts
  (title, post_text, location, region, category, username)
  VALUES
  ('title1', 'text1', 'location1', 1, 1, 'user1'),
  ('title2', 'text2', 'location2', 1, 2, 'user1'),
  ('title3', 'text3', 'location3', 2, 3, 'user2'),
  ('title4', 'text4', 'location4', 4, 3, 'user3'),
  ('title5', 'text5', 'location5', 2, 4, 'user4');

  