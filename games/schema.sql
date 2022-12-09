CREATE TABLE IF NOT EXISTS authors (
    id INT GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    game_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (game_id) REFERENCES games (id)
);

CREATE TABLE IF NOT EXISTS games (
    id INT GENERATED ALWAYS AS IDENTITY,
    multiplayer BOOLEAN NOT NULL,
    last_played DATE NOT NULL,
    publish_date DATE NOT NULL,
    PRIMARY KEY (id)
);

-- Just a comment to be deleted (@Tommymarvel)
