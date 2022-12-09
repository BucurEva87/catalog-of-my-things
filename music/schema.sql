CREATE TABLE IF NOT EXISTS genres (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100),
    music_album_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (music_album_id) REFERENCES music_albums (id)
);

CREATE TABLE IF NOT EXISTS music_albums (
    id INT GENERATED ALWAYS AS IDENTITY,
    on_spotify BOOLEAN NOT NULL,
    publish_date DATE NOT NULL,
    PRIMARY KEY (id)
);
