CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    genre_id INTEGER,
    author_id INTEGER,
    label_id INTEGER,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY(genre_id) REFERENCES genre(id)
)