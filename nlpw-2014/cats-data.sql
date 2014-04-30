-- psql -U postgres -d tapcats < cats-data.sql

INSERT INTO cats (name, breed, origin)
  VALUES ('Kitty', 'Burmese', 'TH');
INSERT INTO cats (name, breed, origin)
  VALUES ('Missy', 'Chartreux', 'FR');
INSERT INTO cats (name, breed, origin)
  VALUES ('Sassy', 'Mau', 'EG');
INSERT INTO cats (name, breed, origin) VALUES
  ('Mitzi', 'Norwegian Forest Cat', 'NO');

INSERT INTO traits (catid, noise, communication, play, ability)
  VALUES (1, 'quiet', 'attentive', 'lively', 'nothing special');
INSERT INTO traits (catid, noise, communication, play, ability)
  VALUES (2, 'very quiet', 'distant', 'moderate', 'looks nice');
INSERT INTO traits (catid, noise, communication, play, ability)
  VALUES (3, 'talkative', 'lots', 'active', 'fetches stuff');
INSERT INTO traits (catid, noise, communication, play, ability)
  VALUES (4, 'more quiet', 'very few', 'a little', 'survives cold');

