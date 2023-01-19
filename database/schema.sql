CREATE TABLE books (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  publisher VARCHAR(100),
  cover_state VARCHAR(100),
  publish_date DATE,
  archived BOOLEAN DEFAULT false,
  label_id INTEGER REFERENCES labels(id)
);

CREATE TABLE labels (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  title VARCHAR(100),
  color VARCHAR(100)
);

CREATE TABLE musicalbum (
  id SERIAL PRIMARY KEY,
  on_spotify BOOLEAN,
  publish_date Date
);

CREATE TABLE genre (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50),
);

CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    genre_id INTEGER,
    author_id INTEGER,
    label_id INTEGER,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY(genre_id) REFERENCES genre(id)
)




