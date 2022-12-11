CREATE TABLE IF NOT EXISTS labels (
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(20),
    book_id INT,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS books (
    id INT GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(100),
    cover_state VARCHAR(4),
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
