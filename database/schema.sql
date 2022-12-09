CREATE DATABASE catalog;

CREATE TABLE genres (
  id NOT NULL PRIMARY KEY,
  name VARCHAR(100),
);

CREATE TABLE music (
  id PRIMARY KEY,
  genre_id INT,
  publish_date DATE,
  on_spotify BOOLEAN,
  name VARCHAR(100)

  FOREIGN KEY (genre_id) REFERENCES genres(id)
);
