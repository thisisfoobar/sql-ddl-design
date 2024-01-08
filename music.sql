-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  artist TEXT NOT NULL
);

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  producer TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  album TEXT NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artist_ids INTEGER ARRAY REFERENCES artists(id) ON DELETE SET NULL,
  album_id INTEGER REFERENCES albums(id) ON DELETE SET NULL,
  producer_ids INTEGER ARRAY REFERENCES producers(id) ON DELETE SET NULL
);

INSERT INTO artists
  (artist)
VALUES
  ('Hanson'),
  ('Queen'),
  ('Mariah Cary'),
  ('Boyz II Men'),
  ('Lady Gaga'),
  ('Bradley Cooper'),
  ('Nickelback'),
  ('Jay Z'),
  ('Alicia Keys'),
  ('Katy Perry'),
  ('Juicy J'),
  ('Maroon 5'),
  ('Christina Aguilera'),
  ('Avril Lavigne'),
  ("Destiny''s Child");

INSERT INTO albums
  (album)
VALUES
  ('Middle of Nowhere'),
  ('A Night at the Opera'),
  ('Daydream'),
  ('A Star Is Born'),
  ('Silver Side Up'),
  ('The Blueprint 3'),
  ('Prism'),
  ('Hands All Over'),
  ('Let Go'),
  ('The Writing''s on the Wall');

INSERT INTO producers
  (producer)
VALUES
  ('Dust Brothers'),
  ('Stephen Lironi'),
  ('Roy Thomas Baker'),
  ('Walter Afanasieff'),
  ('Benjamin Rice'),
  ('Rick Parashar'),
  ('Al Shux'),
  ('Max Martin'),
  ('Cirkut'),
  ('Shellback'),
  ('Benny Blanco'),
  ('The Matrix'),
  ('Dark Child');

INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 1, {1, 2}),
  ('Bohemian Rhapsody', 355, '10-31-1975', {2}, 2, {3}),
  ('One Sweet Day', 282, '11-14-1995', {3, 4}, 3, {4}),
  ('Shallow', 216, '09-27-2018', {5, 6}, 4, {5}),
  ('How You Remind Me', 223, '08-21-2001', {7}, 5, {6}),
  ('New York State of Mind', 276, '10-20-2009', {8, 9}, 6, {7}),
  ('Dark Horse', 215, '12-17-2013', {10, 11}, 7, {8, 9}),
  ('Moves Like Jagger', 201, '06-21-2011', {12, 13}, 8, {10, 11}),
  ('Complicated', 244, '05-14-2002', {14}, 9, {12}),
  ('Say My Name', 240, '11-07-1999', {15}, 10, {13});
