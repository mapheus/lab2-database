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


CREATE TABLE movies (
  imdb_key		TEXT,
  movie_name		TEXT,
  production_year	INT,
  running_time		INT,
  PRIMARY KEY (imdb_key)
);


CREATE TABLE performances (
  performance_id        INT,
  start_time		TIME,
  start_date		DATE,
  theater_name		TEXT,
  imdb_key		TEXT,
  PRIMARY KEY (performance_id),
  FOREIGN KEY (theater_name) REFERENCES theaters(theater_name),
  FOREIGN KEY (imdb_key) REFERENCES movies(imdb_key)
);



CREATE TABLE customers(
  username		TEXT,
  full_name		TEXT,
  password		TEXT,
  PRIMARY KEY (username)
);

CREATE TABLE tickets (
  t_id			TEXT DEFAULT (lower(hex(randomblob(16)))),
  username		TEXT,
  performance_id        INT,
  PRIMARY KEY (t_id),
  FOREIGN KEY (performance_id) REFERENCES performances(performance_id),
  FOREIGN KEY (username) REFERENCES customers(username)
);

INSERT INTO theaters VALUES ("Filmstaden Lund", 237);
INSERT INTO theaters VALUES ("Royal Malmö", 501);
INSERT INTO theaters VALUES ("Filmstaden Uddevalla", 211);


INSERT INTO customers VALUES ("Bertil45", "Bert Jansson", "1234");
INSERT INTO customers VALUES ("Pelle1337", "Pär Nilsson", "password");
INSERT INTO customers VALUES ("Kurtinator", "Kurt Kurtsson", "kurtärbäst");
INSERT INTO customers VALUES ("Nilzzz", "Nils Bo", "zzzlin");
INSERT INTO customers VALUES ("WalterB", "Walter Andersson", "princess");


INSERT INTO movies VALUES ("tt0111161", "The Shawshank Redemption", 1994, 144);
INSERT INTO movies VALUES ("tt0816692", "Interstellar", 2014, 169);
INSERT INTO movies VALUES ("tt0892769", "How to Train your Dragon", 2010, 98);
INSERT INTO movies VALUES ("tt2084970", "The Imitation Game", 2014, 114);
INSERT INTO movies VALUES ("tt1201607", "Harry Potter and the Deathly Hallows: Part 2", 2011, 130);
INSERT INTO movies VALUES ("tt0167260", "Lord of the Rings: The Return of the King", 2003, 201);


INSERT INTO performances VALUES("123", "19:30", "2019-02-16", "Filmstaden Lund", "tt0111161");
INSERT INTO performances VALUES("234", "20:30", "2019-02-16", "Filmstaden Lund", "tt0111161");
INSERT INTO performances VALUES("345", "19:30", "2019-02-14", "Filmstaden Lund", "tt0111161");

INSERT INTO performances VALUES("456", "20:30", "2019-02-15", "Filmstaden Uddevalla", "tt2084970");
INSERT INTO performances VALUES("567", "19:30", "2019-02-14", "Royal Malmö", "tt0816692");


INSERT INTO tickets (performance_id, username) VALUES ("123", "WalterB");
INSERT INTO tickets (performance_id, username) VALUES ("123", "WalterB");
INSERT INTO tickets (performance_id, username) VALUES ("234", "Nilzzz");
INSERT INTO tickets (performance_id, username) VALUES ("567", "Kurtinator");










