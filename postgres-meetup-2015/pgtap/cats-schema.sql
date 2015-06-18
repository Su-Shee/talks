-- psql -U postgres  -1f cats-schema.sqlkittycats

CREATE TABLE cats (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  picture TEXT NOT NULL,
  breed TEXT NOT NULL,
  origin TEXT NOT NULL CHECK (LENGTH(origin) = 2),
  birthday DATE NOT NULL DEFAULT current_date
);

