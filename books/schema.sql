CREATE TABLE IF NOT EXISTS labels (
    id INT GENERATED ALWAYS AS IDENTITY,
    title VARCHAR(100),
    color VARCHAR(20),
    book_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (book_id) REFERENCES books (id)
);

CREATE TABLE IF NOT EXISTS books (
    id INT GENERATED ALWAYS AS IDENTITY,
    publisher VARCHAR(100),
    cover_state VARCHAR(4),
    publish_date DATE NOT NULL,
    PRIMARY KEY (id)
);
