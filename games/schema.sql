CREATE TABLE IF NOT EXISTS authors (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    game_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS games (
    id INT GENERATED ALWAYS AS IDENTITY,
    multiplayer BOOLEAN NOT NULL,
    last_played DATE NOT NULL,
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
