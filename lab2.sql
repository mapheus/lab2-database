-- Delete the tables if they exist.
-- Disable foreign key checks, so the tables can
-- be dropped in arbitrary order.

PRAGMA foreign_keys=OFF;

DROP TABLE IF EXISTS theaters;
DROP TABLE IF EXISTS performances;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS customers;

PRAGMA foreign_keys=ON;

-- Create the tables.

CREATE TABLE theaters (
  theater_name		TEXT,
  capacity		INT,
  PRIMARY KEY  (theater_name)
);


CREATE TABLE performances (
  performance_id	TEXT DEFAULT (lower(hex(randomblob(16)))),
  start_time		TIME,
  theater_name		TEXT,
  imdb_key		TEXT,
  PRIMARY KEY (performance_id),
  FOREIGN KEY (theater_name) REFERENCES theaters(theater_name),
  FOREIGN KEY (imdb_key) REFERENCES movies(imdb_key)
);


CREATE TABLE movies (
  imdb_key		TEXT DEFAULT (lower(hex(randomblob(16)))),
  movie_name		TEXT,
  production_year	INT,
  running_time		INT,
  PRIMARY KEY (imdb_key)
);


CREATE TABLE tickets (
  t_id		TEXT DEFAULT (lower(hex(randomblob(16)))),
  performance_id	TEXT,
  username		TEXT,
  PRIMARY KEY (t_id),
  FOREIGN KEY (performance_id) REFERENCES performances(performance_id),
  FOREIGN KEY (username) REFERENCES customers(username)
);


CREATE TABLE customers(
  username		TEXT,
  full_name		TEXT,
  password		TEXT,
  t_id			TEXT,
  PRIMARY KEY (username),
  FOREIGN KEY (t_id) REFERENCES tickets(t_id)
);




INSERT INTO theaters VALUES ("Filmstaden Lund", 237);
INSERT INTO theaters VALUES ("Royal Malmö", 501);

INSERT INTO movies VALUES ("tt0111161", "The Shawshank Redemption", 1994, 144);
INSERT INTO movies VALUES ("tt0816692", "Interstellar", 2014, 169);
INSERT INTO movies VALUES ("tt0892769", "How to Train your Dragon", 2010, 98);


INSERT INTO performances (start_time, theater_name, imdb_key) VALUES("19:30", "Filmstaden Lund", "tt0111161");

