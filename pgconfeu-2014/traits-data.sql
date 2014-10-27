-- psql -U postgres -1f traits-data.sql kittycats

INSERT INTO traits (kitty, noise, communication, play, ability)
  VALUES (1, 'quiet', 'attentive', 'lively', 'nothing special'),
         (2, 'very quiet', 'distant', 'moderate', 'looks nice'),
         (3, 'talkative', 'lots', 'active', 'fetches stuff'),
         (4, 'more quiet', 'very few', 'a little', 'survives cold');

