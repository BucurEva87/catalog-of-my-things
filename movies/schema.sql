CREATE TABLE IF NOT EXISTS sources (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    movie_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (movie_id) REFERENCES moves (id)
);

CREATE TABLE IF NOT EXISTS movies (
    id INT GENERATED ALWAYS AS IDENTITY,
    silent BOOLEAN NOT NULL,
    publish_date DATE NOT NULL,
    PRIMARY KEY (id)
);
