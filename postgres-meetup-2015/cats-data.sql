-- psql -U postgres -d kittycats < cats-data.sql

INSERT INTO cats (name, picture, breed, origin, birthday)
  VALUES ('Kitty', 'fritz.jpg', 'Burmese', 'TH', '2010-12-06');
INSERT INTO cats (name, picture, breed, origin)
  VALUES ('Missy', 'fritz-comfy.jpg', 'Chartreux', 'FR');
INSERT INTO cats (name, picture, breed, origin, birthday)
  VALUES ('Sassy', 'fritz-desk.jpg', 'Mau', 'EG', '2008-08-04');
INSERT INTO cats (name, picture, breed, origin, birthday) VALUES
  ('Mitzi', 'fritz-sit.jpg', 'Norwegian Forest Cat', 'NO', '2011-03-03');

