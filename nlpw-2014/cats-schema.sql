-- psql -U postgres -d tapcats < cats-schema.sql

CREATE TABLE cats (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  breed TEXT NOT NULL,
  origin TEXT NOT NULL CHECK (LENGTH(origin) = 2),
  birthday DATE NOT NULL DEFAULT current_date
);

CREATE TABLE traits (
  id SERIAL PRIMARY KEY,
  catid SERIAL REFERENCES cats (id),
  noise TEXT,
  communication TEXT,
  play TEXT,
  ability TEXT,
  updated TIMESTAMP
);

CREATE ROLE catsitter LOGIN PASSWORD 'supersecure' VALID UNTIL '2014-04-26';

CREATE FUNCTION my_timestamp () RETURNS trigger AS $timestamped$
  BEGIN
    NEW.updated := current_timestamp(1);
    RETURN NEW;
  END;
$timestamped$ LANGUAGE plpgsql;

CREATE TRIGGER updated BEFORE UPDATE ON traits
    FOR EACH ROW EXECUTE PROCEDURE my_timestamp ();

CREATE TRIGGER created BEFORE INSERT ON traits
    FOR EACH ROW EXECUTE PROCEDURE my_timestamp ();
