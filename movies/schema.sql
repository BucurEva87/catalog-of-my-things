CREATE TABLE IF NOT EXISTS sources (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    movie_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS movies (
    id INT GENERATED ALWAYS AS IDENTITY,
    silent BOOLEAN NOT NULL,
    publish_date DATE NOT NULL,
    label_id INT,
    author_id INT,
    genre_id INT,
    source_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (label_id) REFERENCES labels (id),
    FOREIGN KEY (author_id) REFERENCES authors (id),
    FOREIGN KEY (genre_id) REFERENCES genres (id),
    FOREIGN KEY (source_id) REFERENCES sources (id)
);
