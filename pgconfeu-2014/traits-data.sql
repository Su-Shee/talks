-- psql -U postgres -d tapcats < traits-data.sql

INSERT INTO traits (kitty, noise, communication, play, ability)
  VALUES (1, 'quiet', 'attentive', 'lively', 'nothing special');
INSERT INTO traits (kitty, noise, communication, play, ability)
  VALUES (2, 'very quiet', 'distant', 'moderate', 'looks nice');
INSERT INTO traits (kitty, noise, communication, play, ability)
  VALUES (3, 'talkative', 'lots', 'active', 'fetches stuff');
INSERT INTO traits (kitty, noise, communication, play, ability)
  VALUES (4, 'more quiet', 'very few', 'a little', 'survives cold');

